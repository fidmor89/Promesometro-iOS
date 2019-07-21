//
//  PromesometroService.swift
//  PromesometroService
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation

open class PromesometroService: PromesometroWebService {

    /// URL used for requests.
    open var url: URL? {
        get {
            return baseURL
        }
        set {
            baseURL = newValue
        }
    }

    /// Init with a URL to be used as base url for subsecuent requests.
    ///
    /// - Parameter url: URL
    public convenience init(withURL url: URL) {
        baseURL = url
        self.init()
    }
}
