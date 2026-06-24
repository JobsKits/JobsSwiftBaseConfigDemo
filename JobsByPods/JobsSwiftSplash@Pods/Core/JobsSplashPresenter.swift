//
//  JobsSplashPresenter.swift
//  JobsSwiftSplash
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL

public enum JobsSplashPresenter {

    @discardableResult
    @MainActor
    public static func show(
        over hostViewController: UIViewController,
        configuration: JobsSplashConfiguration
    ) -> JobsSplashVC {
        let splashVC = JobsSplashVC(configuration: configuration)
            .byFrame(hostViewController.view.bounds)
        hostViewController.addChild(splashVC)
        splashVC.view
            .byAutoresizingMask([.flexibleWidth, .flexibleHeight])
            .byAddTo(hostViewController.view)
        splashVC.didMove(toParent: hostViewController)
        DispatchQueue.main.async { [weak splashVC] in
            splashVC?.becomeFirstResponder()
        };return splashVC
    }
}
