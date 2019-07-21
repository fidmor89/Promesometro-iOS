//
//  AppConfiguration.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation

enum AppConfiguration: String {
    case baseURL

    func read<T>() -> T? {
        let plistData = FileManager.readPlistFile(resource: "app.conf", ofType: "plist")

        var enviromentConfiguration = plistData["release"]
        #if DEBUG
        enviromentConfiguration = plistData["debug"]
        #endif

        let appConfiguration = enviromentConfiguration as? [String: AnyObject]
        return appConfiguration?[self.rawValue] as? T
    }
}
