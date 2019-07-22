//
//  PromesometroService+Promise.swift
//  PromesometroService
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation
import PromesometroModel
import PromisedFuture

public extension PromesometroService {
    func getPromises() -> Future<Promises> {
        return request(route: .getPromises)
    }
}
