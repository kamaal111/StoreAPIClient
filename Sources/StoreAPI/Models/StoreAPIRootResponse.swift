//
//  StoreAPIRootResponse.swift
//
//
//  Created by Kamaal M Farah on 23/04/2022.
//

import Foundation

public struct StoreAPIRootResponse: Codable, Hashable {
    public let hello: String

    public init(hello: String) {
        self.hello = hello
    }

    enum CodingKeys: String, CodingKey {
        case hello = "Hello"
    }
}
