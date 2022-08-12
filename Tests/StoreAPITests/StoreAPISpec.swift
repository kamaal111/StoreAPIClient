//
//  StoreAPISpec.swift
//
//
//  Created by Kamaal M Farah on 22/04/2022.
//

import Quick
import Nimble
import Foundation
import MockURLProtocol
@testable import StoreAPI

final class StoreAPISpec: QuickSpec {
    override func spec() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        let storeAPI = StoreAPI(baseURL: URL(string: "http://127.0.0.1:8000")!, urlSession: urlSession)

        describe("root") {
            it("gets root") {
                MockURLProtocol.requestHandler = { _ in
                    let response = HTTPURLResponse(
                        url: storeAPI.baseURL,
                        statusCode: 200,
                        httpVersion: nil,
                        headerFields: nil
                    )!

                    let data = rootResponse.data(using: .utf8)
                    return (response, data)
                }

                waitUntil(timeout: .seconds(1)) { done in
                    Task {
                        let result = await storeAPI.root()
                        let root = try result.get()

                        expect(root.hello) == "World"
                        done()
                    }
                }
            }
        }
    }
}

let rootResponse = """
{
    "Hello": "World"
}
"""
