//
//  BaseStoreAPIClient.swift
//
//
//  Created by Kamaal M Farah on 23/04/2022.
//

import Foundation
import XiphiasNet

public class BaseStoreAPIClient {
    let networker: XiphiasNet
    let baseURL: URL

    public init(baseURL: URL, urlSession: URLSession) {
        self.baseURL = baseURL
        self.networker = .init(urlSession: urlSession)
    }

    public convenience init(baseURL: URL) {
        self.init(baseURL: baseURL, urlSession: .shared)
    }

    public enum Errors: Error, Equatable {
        case generalError(error: Error)
        case responseError(message: String, code: Int)
        case notAValidJSON
        case parsingError(error: Error)
        case invalidURL(url: String)

        public static func == (lhs: Errors, rhs: Errors) -> Bool {
            lhs.identifier == rhs.identifier
        }

        private var identifier: String {
            switch self {
            case let .generalError(error: error): return "general_error_\(error.localizedDescription)"
            case let .responseError(message, code): return "response_error_\(message)_\(code)"
            case .notAValidJSON: return "not_a_valid_json"
            case let .parsingError(error: error): return "parsing_error_\(error.localizedDescription)"
            case let .invalidURL(url: url): return "invalid_url_\(url)"
            }
        }
    }

    func mapXiphiasNetError(_ xiphiasNetError: XiphiasNet.Errors) -> Errors {
        switch xiphiasNetError {
        case let .generalError(error: error): return .generalError(error: error)
        case let .responseError(message, code): return .responseError(message: message, code: code)
        case .notAValidJSON: return .notAValidJSON
        case let .parsingError(error: error): return .parsingError(error: error)
        case let .invalidURL(url: url): return .invalidURL(url: url)
        }
    }
}
