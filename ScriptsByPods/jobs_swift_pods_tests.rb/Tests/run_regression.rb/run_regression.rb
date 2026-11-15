# frozen_string_literal: true

require 'fileutils'
require 'minitest/autorun'
require 'rbconfig'
require 'tmpdir'
require 'timeout'
require_relative '../../jobs_swift_pods_tests'

# 只运行独立 Ruby 子进程和结果树夹具，不调用真实 Xcode、安装或业务 App。
class JobsSwiftPodsRunnerRegression < Minitest::Test
  def setup
    @directory = Dir.mktmpdir('JobsSwiftPodsRunnerRegression-')
    @groups = []
    @fixture_index = 0
  end

  def teardown
    @groups.each do |group|
      Process.kill('KILL', -group)
    rescue Errno::ESRCH
    end
    FileUtils.remove_entry(@directory) if File.directory?(@directory)
  end

  def execute(source, timeout: 2)
    @fixture_index += 1
    group_path = File.join(@directory, "group-#{@fixture_index}")
    child_path = File.join(@directory, "child-#{@fixture_index}")
    log_path = File.join(@directory, "run-#{@fixture_index}.log")
    command = [RbConfig.ruby, '-e', "File.write(ARGV[0], Process.getpgrp);\n#{source}", group_path, child_path]
    result = nil
    capture_io do
      Timeout.timeout(8) do
        result = JobsSwiftPodsTests.run(command, log_path, timeout)
      end
    end
    [result, child_path, log_path]
  ensure
    @groups << Integer(File.read(group_path)) if group_path && File.file?(group_path)
  end

  def active_process?(pid)
    Process.kill(0, pid)
    output, _error, status = Open3.capture3('ps', '-o', 'stat=', '-p', pid.to_s)
    status.success? && !output.strip.empty? && !output.strip.start_with?('Z')
  rescue Errno::ESRCH
    false
  end

  def assert_child_terminated(path)
    assert File.file?(path), '子进程必须先完成启动回执'
    pid = Integer(File.read(path))
    deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 2
    while active_process?(pid) && Process.clock_gettime(Process::CLOCK_MONOTONIC) < deadline
      sleep 0.02
    end
    refute active_process?(pid), "本次夹具子进程 #{pid} 仍在运行"
  end

  def test_success_keeps_output_and_real_exit_status
    result, _child_path, log_path = execute('puts "fixture-success"; exit 0')

    assert result[:success]
    assert_equal 0, result[:exit_code]
    assert result[:process_reaped]
    refute result[:timed_out]
    assert_nil result[:termination_reason]
    assert_includes File.read(log_path), 'fixture-success'
  end

  def test_nonzero_exit_is_not_replaced_by_success
    result, = execute('warn "fixture-failure"; exit 7')

    refute result[:success]
    assert_equal 7, result[:exit_code]
    assert result[:process_reaped]
    refute result[:timed_out]
  end

  def test_live_leader_is_stopped_at_the_deadline
    result, = execute('sleep 30', timeout: 0.2)

    refute result[:success]
    assert result[:timed_out]
    assert_equal 'process_timeout', result[:termination_reason]
    assert result[:process_reaped]
    assert_operator result[:seconds], :<, 5
  end

  def test_exited_leader_does_not_disable_timeout_for_an_inherited_pipe
    result, child_path = execute(<<~'SOURCE', timeout: 0.2)
      child = fork { sleep 30 }
      File.write(ARGV[1], child)
      puts 'leader exited with descendant holding stdout'
      exit 0
    SOURCE

    refute result[:success]
    assert_equal 0, result[:exit_code]
    assert result[:timed_out]
    assert result[:process_reaped]
    assert_operator result[:seconds], :<, 5
    assert_child_terminated(child_path)
  end

  def test_ignored_term_in_descendant_is_escalated_after_the_leader_exits
    sentinel = Process.spawn(RbConfig.ruby, '-e', 'sleep 30', pgroup: true,
                             out: File::NULL, err: File::NULL)
    @groups << sentinel
    result, child_path = execute(<<~'SOURCE', timeout: 0.2)
      reader, writer = IO.pipe
      child = fork do
        reader.close
        trap('TERM', 'IGNORE')
        writer.write('ready')
        writer.close
        sleep 30
      end
      writer.close
      reader.read
      reader.close
      File.write(ARGV[1], child)
      trap('TERM') { exit 7 }
      puts 'ready for timeout'
      sleep 30
    SOURCE

    refute result[:success]
    assert_equal 7, result[:exit_code]
    assert result[:timed_out]
    assert result[:process_reaped]
    assert_operator result[:seconds], :<, 5
    assert_child_terminated(child_path)
    assert active_process?(sentinel), '不能结束不属于本次命令进程组的进程'
  ensure
    if sentinel
      begin
        Process.kill('KILL', sentinel)
      rescue Errno::ESRCH
      end
      Process.wait(sentinel)
    end
  end

  def test_output_drain_has_a_bound_even_when_the_phase_budget_is_long
    result, child_path = execute(<<~'SOURCE', timeout: 30)
      child = fork { sleep 30 }
      File.write(ARGV[1], child)
      exit 0
    SOURCE

    refute result[:success]
    assert_equal 'output_drain_timeout', result[:termination_reason]
    assert_equal 0, result[:exit_code]
    assert_operator result[:seconds], :<, 6
    assert_child_terminated(child_path)
  end

  def test_result_tree_requires_each_selected_pod_and_real_passing_cases
    targets = [{ name: 'JobsFixture', product: 'JobsFixture_Tests.xctest' }]
    passing = { 'nodeType' => 'Unit test bundle', 'name' => 'JobsFixture_Tests',
                'children' => [{ 'nodeType' => 'Test Suite', 'children' => [
                  { 'nodeType' => 'Test Case', 'name' => 'testBoundary', 'result' => 'Passed' }
                ] }] }
    assert_equal({ 'JobsFixture' => 1 }, JobsSwiftPodsTests.verify_test_tree({ 'testNodes' => [passing] }, targets))
    assert_raises(RuntimeError) { JobsSwiftPodsTests.verify_test_tree({ 'testNodes' => [] }, targets) }
    assert_raises(RuntimeError) do
      JobsSwiftPodsTests.verify_test_tree({ 'testNodes' => [passing.merge('children' => [])] }, targets)
    end
    assert_raises(RuntimeError) do
      JobsSwiftPodsTests.verify_test_tree({ 'testNodes' => [passing, passing] }, targets)
    end
    %w[Failed Skipped Expected\ Failure].each do |result|
      failed = Marshal.load(Marshal.dump(passing))
      failed['children'][0]['children'][0]['result'] = result
      assert_raises(RuntimeError) { JobsSwiftPodsTests.verify_test_tree({ 'testNodes' => [failed] }, targets) }
    end
  end
end
