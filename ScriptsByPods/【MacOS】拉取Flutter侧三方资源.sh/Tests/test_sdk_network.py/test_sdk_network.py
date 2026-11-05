"""Real resource-pull entry and SDK adapter; network and SDK executables are fixtures."""
import json
import os
from pathlib import Path
import re
import signal
import shutil
import subprocess
import sys
import tempfile
import unittest

PACKAGE = Path(__file__).resolve().parents[2]


class ResourceSdkTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='Jobs Flutter 资源 ')
        self.root = Path(self.temp.name)
        self.package = self.root / '移走的脚本'
        shutil.copytree(PACKAGE / 'Scripts', self.package / 'Scripts')
        source = (PACKAGE / PACKAGE.name).read_text()
        source, count = re.subn(r'\nmain "\$@"\s*\Z', '\n', source)
        self.assertEqual(1, count)
        self.library = self.package / 'library.zsh'
        self.library.write_text(source)
        self.project = self.root / '工程'
        self.project.mkdir()
        (self.project / 'pubspec.yaml').write_text('name: fixture\n')
        self.sdk = self.root / 'SDK'
        (self.sdk / 'bin').mkdir(parents=True)
        (self.sdk / 'bin/flutter').write_text('#!' + sys.executable + '\n' + r'''import json,os,pathlib,sys
args=sys.argv[1:]
root=pathlib.Path(os.environ['TEST_ROOT'])
with (root/'calls').open('a') as f:f.write(json.dumps(args)+'\n')
if args==['--version']:
 countfile=root/'versions'; count=int(countfile.read_text())+1 if countfile.exists() else 1;countfile.write_text(str(count))
 if count==1 and os.environ.get('FAIL_VERSION'):sys.exit(28)
 print('Flutter fixture');sys.exit(0)
if args==['pub','get']:sys.exit(29)
sys.exit(3)
''')
        (self.sdk / 'bin/flutter').chmod(0o700)
        core = self.package / 'Scripts/【MacOS】FlutterSDK网络选路.zsh/【MacOS】FlutterSDK网络选路.zsh'
        override = r'''
jobs_flutter_route_prepare() {
  print -r -- "$4|$1|$2" >> "$TEST_ROOT/probes"
  [[ "${TEST_CANCEL:-0}" != 1 ]] || return 130
  export FLUTTER_STORAGE_BASE_URL=https://fixture-selected.test
}
'''
        boundary = 'if [[ "$ZSH_EVAL_CONTEXT" == toplevel ]]; then jfs_route_main "$@"; fi'
        self.assertEqual(1, core.read_text().count(boundary))
        core.write_text(core.read_text().replace(boundary, override + '\n' + boundary))
        self.env = dict(os.environ, TEST_ROOT=str(self.root), TEST_LIBRARY=str(self.library),
                        TEST_PROJECT=str(self.project), TEST_FLUTTER=str(self.sdk / 'bin/flutter'),
                        PATH=str(self.sdk / 'bin') + ':/usr/bin:/bin:/usr/sbin:/sbin',
                        HOME=str(self.root / 'home'), TMPDIR=str(self.root) + '/', NO_COLOR='1')
        forbidden = self.root / 'forbidden-network'
        forbidden.write_text('#!/bin/sh\necho unexpected-network >> "$TEST_ROOT/probes"\nexit 99\n')
        forbidden.chmod(0o700)
        self.env.update(JOBS_FLUTTER_ROUTE_CURL=str(forbidden), JOBS_FLUTTER_ROUTE_GIT=str(forbidden))
        for key in ('JOBS_FLUTTER_ROUTE_CACHE_DIR', 'JOBS_FLUTTER_ROUTE_SDK_ROOT', 'JOBS_FLUTTER_ROUTE_VERSION'):
            self.env.pop(key, None)

    def tearDown(self):
        self.temp.cleanup()

    def run_zsh(self, code, expected, extra=None):
        setup = 'source "$TEST_LIBRARY"\nLOG_FILE="$TEST_ROOT/sdk.log"\n'
        process = subprocess.Popen(['/bin/zsh', '-f', '-c', setup + code], env=dict(self.env, **(extra or {})),
                                   cwd=self.project, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
        try:
            output, error = process.communicate(timeout=20)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            output, error = process.communicate()
            self.fail('isolated fixture timeout: ' + output + error)
        result = subprocess.CompletedProcess(process.args, process.returncode, output, error)
        probe_file = self.root / 'probes'
        self.assertNotIn('unexpected-network', probe_file.read_text() if probe_file.exists() else '')
        self.assertEqual(expected, result.returncode, result.stdout + result.stderr)
        return result

    def calls(self):
        path = self.root / 'calls'
        return [json.loads(row) for row in path.read_text().splitlines()] if path.exists() else []

    def test_health_download_retries_then_pub_business_fails_only_once(self):
        self.run_zsh('find_flutter_command || exit $?\nrun_flutter_pub_get "$TEST_PROJECT"\n', 1, {'FAIL_VERSION': '1'})
        calls = self.calls()
        self.assertEqual([['--version'], ['--version'], ['--version'], ['pub', 'get']], calls)
        self.assertEqual(1, calls.count(['pub', 'get']))
        self.assertNotIn(str(PACKAGE), self.library.read_text())

    def test_cancelled_health_stops_all_fallbacks_and_business(self):
        self.run_zsh('''ROOT_DIR="$TEST_PROJECT" DEFAULT_FLUTTER_DIR="$TEST_PROJECT" DEFAULT_PODHELPER=fixture
flutter_module_is_ready() { return 1; }
run_flutter_resource_pull
''', 130, {'TEST_CANCEL': '1'})
        self.assertEqual([], self.calls())
        self.assertEqual(1, len((self.root / 'probes').read_text().splitlines()))

    def test_direct_cancelled_pub_preparation_preserves_code(self):
        self.run_zsh('FLUTTER_CMD=("$TEST_FLUTTER")\nrun_flutter_pub_get "$TEST_PROJECT"\n', 130, {'TEST_CANCEL': '1'})
        self.assertEqual([], self.calls())

    def test_healthy_module_skip_does_not_probe_or_require_sdk(self):
        self.run_zsh('''ROOT_DIR="$TEST_PROJECT" DEFAULT_FLUTTER_DIR="$TEST_PROJECT" DEFAULT_PODHELPER=fixture
flutter_module_is_ready() { return 0; }
run_flutter_resource_pull
''', 0)
        self.assertEqual([], self.calls())
        self.assertFalse((self.root / 'probes').exists())


if __name__ == '__main__':
    unittest.main()
