//
//  StoreAPITransactionClient.swift
//
//
//  Created by Kamaal Farah on 25/04/2022.
//

import Foundation
import XiphiasNet

public final class StoreAPITransactionClient: BaseStoreAPIClient {
    public func getHistory(originalTransactionID: Int) async -> Result<StoreAPITransactionHistory, Errors> {
        let url = baseURL
            .appendingPathComponent("transaction-history")
            .appendingPathComponent("\(originalTransactionID)")
        let config = XRequestConfig(priority: XRequestConfig.defaultPriority, kowalskiAnalysis: false)
        let result: Result<Response<StoreAPITransactionHistory>, XiphiasNet.Errors> = await networker.request(
            from: url,
            config: config
        )

        return result
            .map(\.data)
            .mapError(mapXiphiasNetError(_:))
    }
}
