//
//  PromesometroService.swift
//  PromesometroService
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Alamofire
import Foundation
import PromisedFuture

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

    /// Makes a request using Alamofire default instance.
    ///
    /// - Parameters:
    ///   - route: Rote to request
    ///   - decoder: optional decoder for custom object decoding.
    /// - Returns: Future with promised response of T.type
    @discardableResult
    internal func request<T>(route: PromesometroRouter,
                             decoder: JSONDecoder = JSONDecoder()) -> Future<T> where T: Decodable {
        return Future(operation: { completion in
            AF.request(route)
                .validate()
                .responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T>) in
                    print("From: \(route.path) Response: \(response.result)")
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
        })
    }
}
