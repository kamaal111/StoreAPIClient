//
//  StoreAPITransactionHistory.swift
//
//
//  Created by Kamaal Farah on 25/04/2022.
//

import Foundation

public struct StoreAPITransactionHistory: Codable, Hashable {
    public let revision: String
    public let bundleID: String
    public let environment: StoreAPIEnvironment
    public let hasMore: Bool

    public init(revision: String, bundleID: String, environment: StoreAPIEnvironment, hasMore: Bool) {
        self.revision = revision
        self.bundleID = bundleID
        self.environment = environment
        self.hasMore = hasMore
    }

    enum CodingKeys: String, CodingKey {
        case revision
        case bundleID = "bundle_id"
        case environment
        case hasMore = "has_more"
    }
}
