//
//  PromiseDetailViewModel.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation
import PromesometroModel

struct PromiseDetailViewModel {
    let promise: Promise

    init(promise: Promise) {
        self.promise = promise
    }
}
