//
//  AppDelegate.swift
//  App
//
//  Created by Yuto Mizutani on 2020/01/20.
//  Copyright © 2020 YutoMizutani. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let bundleID = Bundle.main.bundleIdentifier
    private var appGroupsID: String {
        "group.\(bundleID!)"
    }
    private let userDefaultsKey: String = "public.url"

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        print(appGroupsID, UserDefaults(suiteName: appGroupsID)?.string(forKey: userDefaultsKey) ?? "")

        window?.rootViewController?.view.addSubview(
            {
                let label = UILabel(frame: window!.frame)
                label.textAlignment = .center
                label.text = UserDefaults(suiteName: appGroupsID)?.string(forKey: userDefaultsKey)
                return label
            }()
        )

        return true
    }
}
