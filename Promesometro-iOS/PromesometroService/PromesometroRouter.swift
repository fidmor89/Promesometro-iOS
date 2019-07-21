//
//  PromesometroRouter.swift
//  PromesometroService
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Alamofire
import Foundation

internal enum PromesometroRouter: Router {

    // TODO: Define the correct routes
    case getAlgo
    case postAlgo(Encodable)

    // MARK: - HTTPMethod

    var method: HTTPMethod {
        switch self {
        case .postAlgo:
            return .post
        default:
            return .get
        }
    }

    // MARK: - Path

    var path: String {
        switch self {
        case .getAlgo:
            return "/somewhere"
        case .postAlgo:
            return "/shomewhereElse"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .postAlgo(let params):
            return params.asDictionary
        default:
            return nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        // TODO: Read from configuration file.
        guard let url = URL(string: "https://www.google.com/") else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        print("URL request: \(urlRequest)")

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}
