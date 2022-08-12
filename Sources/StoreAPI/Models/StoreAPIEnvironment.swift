//
//  StoreAPIEnvironment.swift
//
//
//  Created by Kamaal Farah on 25/04/2022.
//

import Foundation

public enum StoreAPIEnvironment: Codable, Hashable {
    case sandbox
    case production

    enum CodingKeys: String, CodingKey {
        case sandbox = "Sandbox"
        case production = "Production"
    }
}
