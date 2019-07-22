//
//  PromiseTableViewModel.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation
import PromesometroModel
import RxCocoa

class PromiseTableViewModel {

    // MARK: - Properties

    var error: BehaviorRelay<Error?> = BehaviorRelay(value: nil)
    private var promisesRelay: BehaviorRelay<Promises> = BehaviorRelay(value: [])
    var promises: Promises {
        return promisesRelay.value
    }

    // MARK: - Actions

    func getPromises() -> BehaviorRelay<Promises> {
        webService
            .getPromises()
            .execute(onSuccess: { response in
                self.promisesRelay.accept(response)
                self.error.accept(nil)
            }, onFailure: { error in
                self.error.accept(error)
            })
        return promisesRelay
    }
}
