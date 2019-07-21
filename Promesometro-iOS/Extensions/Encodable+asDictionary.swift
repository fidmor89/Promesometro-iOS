//
//  Encodable+asDictionary.swift
//  PromesometroService
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation

extension Encodable {

    /// Flat maps a JSON from an encodable object to create a dictionary
    var asDictionary: [String: Any] {
        guard
            let data = try? JSONEncoder().encode(self),
            let dict = (try? JSONSerialization.jsonObject(with: data,
                                                          options: .allowFragments)).flatMap({ $0 as? [String: Any] })
            else {
                return [:]
        }
        return dict
    }
}
