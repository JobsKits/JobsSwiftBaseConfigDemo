//
//  JobsUIKitRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import XCTest
import UIKit
import WebKit
import JobsSwiftDSL
import JobsGetWindow
import JobsSwiftBaseTools
import JobsByUIKit
import BRPickerViewSwift
import JobsInheritance
import JobsSwiftCalendar
import JobsSwiftComment
import JobsScale
import JobsSwiftGraphicCaptcha

@MainActor
final class JobsUIKitRegression: XCTestCase {
    func testGrayPatternAndStrictHexConversion() throws {
        let gray = try XCTUnwrap(UIColor(white: 0.4, alpha: 1).jobsRGBComponents())
        // RGB 输出延续 getRGB 的 255 标度：系统灰度 0.4 对应每个通道 102。
        XCTAssertEqual(gray.0, 102, accuracy: 0.001)
        XCTAssertEqual(gray.1, 102, accuracy: 0.001)
        XCTAssertEqual(gray.2, 102, accuracy: 0.001)
        for invalid in ["", "12", "FFFFFFgarbage", "00GG00", "#1234567", "12345G"] {
            XCTAssertNil(UIColor(hex: invalid), invalid)
        }
        let color = try XCTUnwrap(UIColor(hex: "#112233", alpha: 0.25))
        var alpha: CGFloat = 0
        XCTAssertTrue(color.getRed(nil, green: nil, blue: nil, alpha: &alpha))
        XCTAssertEqual(alpha, 0.25, accuracy: 0.001)
        let image = UIGraphicsImageRenderer(size: CGSize(width: 2, height: 2)).image { context in
            UIColor.red.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 2, height: 2))
        }
        XCTAssertNil(UIColor(patternImage: image).jobsRGBComponents())
    }

    func testEmptyContainerVisibleControllerTerminates() {
        XCTAssertTrue(jobsGetMainWindow() === JobsGetWindow.jobsGetMainWindow())
        XCTAssertTrue(jobsGetMainWindowBefore13() === JobsGetWindow.jobsGetMainWindowBefore13())
        XCTAssertTrue(jobsGetMainWindowAfter13() === JobsGetWindow.jobsGetMainWindowAfter13())
        XCTAssertTrue(legacyKeyWindowPreiOS13() === JobsGetWindow.legacyKeyWindowPreiOS13())
        for scene in UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }) {
            XCTAssertTrue(scene.keyWindowCompat === scene.keyWindow)
        }
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 640))
        let containers: [UIViewController] = [UINavigationController(), UITabBarController(),
                                             UISplitViewController(), UIPageViewController()]
        for container in containers {
            window.rootViewController = container
            XCTAssertTrue(UIApplication.jobsTopMostVC(from: window.rootViewController) === container)
        }
        let leaf = UIViewController()
        let nav = UINavigationController(rootViewController: leaf)
        XCTAssertTrue(UIApplication.jobsTopMostVC(from: nav) === leaf)
    }

    func testPickerTaskCancellationReturnsTerminalResult() async {
        let picker = BRBasePicker<String>()
        let task = Task { @MainActor in try await picker.awaitResult() }
        await Task.yield()
        task.cancel()
        do {
            _ = try await task.value
            XCTFail("Cancelled picker must throw")
        } catch is CancellationError {
        } catch {
            XCTFail("Unexpected picker error: \(error)")
        }
        let optionalTask = Task { @MainActor in try await picker.awaitResultOrNil() }
        await Task.yield()
        optionalTask.cancel()
        do {
            let value = try await optionalTask.value
            XCTAssertNil(value)
        } catch {
            XCTFail("Cancellation convenience must return nil: \(error)")
        }
    }

    func testPickerInitialOffWindowAndSynchronousWindowTransferKeepAwaiting() async throws {
        let frame = CGRect(x: 0, y: 0, width: 320, height: 640)
        let firstWindow = UIWindow(frame: frame)
        let secondWindow = UIWindow(frame: frame)
        let host = UIView(frame: frame)
        let picker = BRStringPicker().byDataSource(["picked"]).byPresent(in: host)
        let panel = try XCTUnwrap(host.subviews.compactMap { $0 as? BRPickerPanel }.first)
        let completed = expectation(description: "Picker still confirms after window transfer")
        var selected: String?
        let waiting = Task { @MainActor in
            do {
                selected = try await picker.awaitResult()
            } catch {
                XCTFail("Preparing or synchronously transferring a panel must not cancel: \(error)")
            }
            completed.fulfill()
        }
        let prepared = expectation(description: "Initial off-window turn")
        DispatchQueue.main.async { prepared.fulfill() }
        await fulfillment(of: [prepared], timeout: 2)
        XCTAssertNil(panel.window)
        firstWindow.addSubview(host)
        XCTAssertTrue(panel.window === firstWindow)
        secondWindow.addSubview(host)
        XCTAssertTrue(panel.window === secondWindow)
        let nextHost = UIView(frame: frame)
        firstWindow.addSubview(nextHost)
        panel.present(in: nextHost)
        XCTAssertTrue(panel.window === firstWindow)
        DispatchQueue.main.async { picker.confirmSelection() }
        await fulfillment(of: [completed], timeout: 2)
        waiting.cancel()
        await waiting.value
        XCTAssertEqual(selected, "picked")
        panel.dismiss()
    }

    func testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain() async throws {
        let frame = CGRect(x: 0, y: 0, width: 320, height: 640)
        let window = UIWindow(frame: frame)
        let host = UIView(frame: frame)
        window.addSubview(host)
        let picker = BRStringPicker().byDataSource(["picked"]).byPresent(in: host)
        let panel = try XCTUnwrap(host.subviews.compactMap { $0 as? BRPickerPanel }.first)
        XCTAssertTrue(panel.window === window)
        let dismissed = expectation(description: "Host leaving its window cancels picker")
        var hostCancellationReceived = false
        let waiting = Task { @MainActor in
            do {
                _ = try await picker.awaitResult()
                XCTFail("A departed host must not return a successful selection")
            } catch BRPickerAwaitError.cancelled {
                hostCancellationReceived = true
            } catch is CancellationError {
            } catch {
                XCTFail("Unexpected host departure error: \(error)")
            }
            dismissed.fulfill()
        }
        await Task.yield()
        host.removeFromSuperview()
        await fulfillment(of: [dismissed], timeout: 2)
        waiting.cancel()
        await waiting.value
        XCTAssertTrue(hostCancellationReceived)

        let nextHost = UIView(frame: frame)
        window.addSubview(nextHost)
        picker.byPresent(in: nextHost)
        let nextPanel = try XCTUnwrap(nextHost.subviews.compactMap { $0 as? BRPickerPanel }.first)
        let confirmed = expectation(description: "Reused picker confirms in a new host")
        var selected: String?
        let nextWait = Task { @MainActor in
            do {
                selected = try await picker.awaitResult()
            } catch {
                XCTFail("A new presentation must allow a new await: \(error)")
            }
            confirmed.fulfill()
        }
        DispatchQueue.main.async { picker.confirmSelection() }
        await fulfillment(of: [confirmed], timeout: 2)
        nextWait.cancel()
        await nextWait.value
        XCTAssertEqual(selected, "picked")
        nextPanel.dismiss()
    }

    func testWebConfigurationAppliesBeforeFirstDocument() {
        let view = BaseWebView(frame: .zero)
        let original = view.webView
        view.byWebViewConfiguration { config in
            config.allowsInlineMediaPlayback = false
        }.byPersistentStore()
        XCTAssertFalse(view.webView === original)
        XCTAssertFalse(view.webView.configuration.allowsInlineMediaPlayback)
        XCTAssertTrue(view.webView.configuration.websiteDataStore.isPersistent)
        XCTAssertNil(view.lastConfigurationError)
    }

    func testJavaScriptUndefinedResolvesAsNil() async throws {
        let view = BaseWebView(frame: .zero)
        let value = try await view.evalAsyncRaw("void 0", timeout: 5)
        XCTAssertNil(value)
    }

    func testCalendarWeekAnchorHonorsFirstWeekdayAcrossMonth() throws {
        let view = JobsSwiftCalendar(frame: .zero)
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = try XCTUnwrap(TimeZone(secondsFromGMT: 0))
        calendar.firstWeekday = 2
        view.gregorian = calendar
        view.scope = .week
        let date = try XCTUnwrap(calendar.date(from: DateComponents(year: 2026, month: 10, day: 1)))
        view.setCurrentPage(date, animated: false)
        let page = calendar.dateComponents([.year, .month, .day, .weekday], from: view.currentPage)
        XCTAssertEqual(page.year, 2026)
        XCTAssertEqual(page.month, 9)
        XCTAssertEqual(page.day, 28)
        XCTAssertEqual(page.weekday, 2)
    }

    func testDeepCommentTreeStopsAtConfiguredBudget() {
        let config = JobsSwiftCommentConfig()
        config.maxReplyDepth = 8
        config.maxRenderedRows = 20
        config.maxVisibleChildReplyCount = 100
        var comment = JobsSwiftCommentModel(messageID: "leaf", nickname: "Jobs", replyID: "",
                                           publishTime: "", content: "leaf")
        for depth in (0..<200).reversed() {
            comment = JobsSwiftCommentModel(messageID: "\(depth)", nickname: "Jobs", replyID: "",
                                            publishTime: "", content: "reply", children: [comment])
        }
        let view = JobsSwiftCommentView(config: config)
        view.reloadWithComments([comment])
        XCTAssertLessThanOrEqual(view.tableView(view.tableView, numberOfRowsInSection: 0), 20)
        XCTAssertTrue(view.isRenderTruncated)
        view.reloadWithComments([])
        XCTAssertFalse(view.isRenderTruncated)
    }

    func testScaleInvalidDesignDimensionsHaveFiniteWindowScale() {
        defer { JobsScale.setup(designWidth: 375, designHeight: 812) }
        JobsScale.setup(designWidth: .nan, designHeight: 0)
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 812))
        XCTAssertEqual(JobsScale.widthScale(in: window), 1, accuracy: 0.001)
        XCTAssertEqual(JobsScale.heightScale(in: window), 1, accuracy: 0.001)
    }
    func testServerCaptchaRejectsLocalAnswerAndIgnoresPreviousChallenge() async throws {
        let view = JobsSwiftGraphicCaptchaView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        var completions: [(Result<JobsGraphicCaptchaChallenge, Error>) -> Void] = []
        view.serverChallengeProvider = { callback in
            completions.append(callback)
            return nil
        }
        view.usesServerValidation = true
        view.refreshCaptcha()
        XCTAssertEqual(completions.count, 2)
        XCTAssertFalse(view.validateInput(view.captchaText))
        let loaded = expectation(description: "Current challenge loaded")
        view.onChallengeChanged = { challenge in
            if challenge?.identifier == "current" { loaded.fulfill() }
        }
        let image = UIGraphicsImageRenderer(size: CGSize(width: 4, height: 4)).image { _ in }
        completions[0](.success(JobsGraphicCaptchaChallenge(identifier: "stale", image: image)))
        completions[1](.success(JobsGraphicCaptchaChallenge(identifier: "current", image: image,
                                                            expiresAt: Date().addingTimeInterval(30))))
        await fulfillment(of: [loaded], timeout: 2)
        XCTAssertEqual(view.serverChallenge?.identifier, "current")
        let verified = expectation(description: "Server verification completed once")
        var calls = 0
        view.serverVerifier = { id, input, callback in
            XCTAssertEqual(id, "current")
            XCTAssertEqual(input, "typed")
            callback(.success(true))
            callback(.success(false))
            return nil
        }
        view.verifyInput("typed") { result in
            calls += 1
            if case .success(true) = result { verified.fulfill() }
            else { XCTFail("Expected actual server success") }
        }
        await fulfillment(of: [verified], timeout: 2)
        XCTAssertEqual(calls, 1)
        XCTAssertNil(view.serverChallenge)
    }

    func testCaptchaConsumeNotificationCanRefreshWithoutCancellingSuccess() async {
        let view = JobsSwiftGraphicCaptchaView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let image = UIGraphicsImageRenderer(size: CGSize(width: 4, height: 4)).image { _ in }
        var providerCalls = 0
        view.serverChallengeProvider = { callback in
            providerCalls += 1
            callback(.success(JobsGraphicCaptchaChallenge(identifier: "challenge-\(providerCalls)", image: image)))
            return nil
        }
        let initial = expectation(description: "Initial challenge")
        let refreshed = expectation(description: "Next challenge")
        var startedVerification = false
        var didAutoRefresh = false
        view.onChallengeChanged = { challenge in
            if challenge?.identifier == "challenge-1" {
                initial.fulfill()
            } else if challenge?.identifier == "challenge-2" {
                refreshed.fulfill()
            } else if challenge == nil, startedVerification, !didAutoRefresh {
                didAutoRefresh = true
                view.refreshCaptcha()
            }
        }
        view.usesServerValidation = true
        await fulfillment(of: [initial], timeout: 2)
        view.serverVerifier = { _, _, callback in
            callback(.success(true))
            return nil
        }
        let verified = expectation(description: "Success survives notification reentry")
        var completionCalls = 0
        startedVerification = true
        view.verifyInput("typed") { result in
            completionCalls += 1
            if case .success(true) = result {
                verified.fulfill()
            } else {
                XCTFail("Refreshing the consumed challenge must not cancel accepted verification")
            }
        }
        await fulfillment(of: [verified, refreshed], timeout: 2)
        XCTAssertEqual(completionCalls, 1)
        XCTAssertEqual(view.serverChallenge?.identifier, "challenge-2")
    }

    func testCaptchaCancellationCallbackKeepsNewestVerification() async {
        let view = JobsSwiftGraphicCaptchaView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let image = UIGraphicsImageRenderer(size: CGSize(width: 4, height: 4)).image { _ in }
        view.serverChallengeProvider = { callback in
            callback(.success(JobsGraphicCaptchaChallenge(identifier: "current", image: image)))
            return nil
        }
        let loaded = expectation(description: "Challenge loaded")
        view.onChallengeChanged = { challenge in
            if challenge != nil { loaded.fulfill() }
        }
        view.usesServerValidation = true
        await fulfillment(of: [loaded], timeout: 2)
        var inputs: [String] = []
        var callbacks: [(Result<Bool, Error>) -> Void] = []
        view.serverVerifier = { _, input, callback in
            inputs.append(input)
            callbacks.append(callback)
            return nil
        }
        let newest = expectation(description: "Newest verification completes")
        var firstCalls = 0
        view.verifyInput("first") { result in
            firstCalls += 1
            guard case .failure(let error) = result,
                  let captchaError = error as? JobsGraphicCaptchaError,
                  case .cancelled = captchaError else {
                XCTFail("Replaced first verification must cancel")
                return
            }
            view.verifyInput("newest") { result in
                if case .success(true) = result {
                    newest.fulfill()
                } else {
                    XCTFail("Newest reentrant verification must remain pending")
                }
            }
        }
        var supersededCalls = 0
        view.verifyInput("superseded") { result in
            supersededCalls += 1
            if case .failure(let error) = result,
               let captchaError = error as? JobsGraphicCaptchaError,
               case .cancelled = captchaError {
            } else {
                XCTFail("The reentrant request must supersede the outer request")
            }
        }
        XCTAssertEqual(inputs, ["first", "newest"])
        XCTAssertEqual(firstCalls, 1)
        XCTAssertEqual(supersededCalls, 1)
        guard callbacks.count == 2 else {
            XCTFail("Exactly the first and newest requests should start the verifier")
            return
        }
        callbacks[0](.success(true))
        callbacks[1](.success(true))
        await fulfillment(of: [newest], timeout: 2)
    }

}
