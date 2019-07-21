//
//  FileManager+Plist.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation

extension FileManager {
    static func readPlistFile(resource: String, ofType type: String) -> [String: AnyObject] {
        var plistFormat = PropertyListSerialization.PropertyListFormat.xml
        let empty: [String: AnyObject] = [:]
        guard
            let plistPath = Bundle.main.path(forResource: resource, ofType: type),
            let plistXML = FileManager.default.contents(atPath: plistPath) else {
                return empty
        }

        let plistData = try? PropertyListSerialization.propertyList(from: plistXML,
                                                                    options: .mutableContainersAndLeaves,
                                                                    format: &plistFormat) as? [String: AnyObject]
        return plistData ?? empty
    }
}
