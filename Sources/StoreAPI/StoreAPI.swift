//
//  StoreAPI.swift
//
//
//  Created by Kamaal M Farah on 22/04/2022.
//

import Foundation
import XiphiasNet

/// StorAPI client
public class StoreAPI: BaseStoreAPIClient {
    public var transaction: StoreAPITransactionClient!

    override public init(baseURL: URL, urlSession: URLSession) {
        super.init(baseURL: baseURL, urlSession: urlSession)
        self.transaction = StoreAPITransactionClient(baseURL: baseURL, urlSession: urlSession)
    }

    public convenience init(baseURL: URL) {
        self.init(baseURL: baseURL, urlSession: .shared)
    }

    public func root() async -> Result<StoreAPIRootResponse, Errors> {
        let config = XRequestConfig(priority: XRequestConfig.defaultPriority, kowalskiAnalysis: false)
        let result: Result<Response<StoreAPIRootResponse>, XiphiasNet.Errors> = await networker.request(
            from: baseURL,
            config: config
        )
        return result
            .map(\.data)
            .mapError(mapXiphiasNetError(_:))
    }
}
