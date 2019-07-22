//
//  Promise.swift
//  PromesometroModel
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import Foundation

public typealias Promises = [Promise]

// MARK: - Promise
public struct Promise: Codable {
   public let promiseID: Int?
   public let promise: String?
   public let candidateID: Int?
   public let name, party: String?
   public let partyID: Int?
   public let position: String?
   public let positionID: Int?
   public let picURL: String?
   public let shortName: String?

    enum CodingKeys: String, CodingKey {
        case promiseID = "PROMISE_ID"
        case promise = "PROMISE"
        case candidateID = "CANDIDATE_ID"
        case name = "NAME"
        case party = "PARTY"
        case partyID = "PARTY_ID"
        case position = "POSITION"
        case positionID = "POSITION_ID"
        case picURL = "PIC_URL"
        case shortName = "SHORT_NAME"
    }
}
