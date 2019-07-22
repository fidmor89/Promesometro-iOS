//
//  AppDelegate.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import PromesometroService
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // swiftlint:disable:previous discouraged_optional_collection

        webServiceSetup()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

// MARK: - Helpers
extension AppDelegate {
    func webServiceSetup() {
        guard
            let uri: String = AppConfiguration.baseURL.read(),
            let url = URL(string: uri) else {
                fatalError("Missing base url")
        }
        webService = PromesometroService(withURL: url)
    }
}
