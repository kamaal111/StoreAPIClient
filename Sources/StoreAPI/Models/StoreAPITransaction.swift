//
//  StoreAPITransaction.swift
//
//
//  Created by Kamaal Farah on 25/04/2022.
//

import Foundation

public struct StoreAPITransaction: Codable, Hashable {
    public let transactionID: String
    public let originalTransactionID: String
    public let webOrderLineItemID: String
    public let bundleID: String
    public let productID: String
    public let subscriptionGroupIdentifier: String
    public let quantity: Int
    public let transactionType: TransactionType
    public let inAappOwnershipType: InAappOwnershipType
    public let environment: StoreAPIEnvironment

    private let _purchaseDate: Int
    private let _originalPurchaseDate: Int
    private let _expiresDate: Int
    private let _signedDate: Int

    init(
        transactionID: String,
        originalTransactionID: String,
        webOrderLineItemID: String,
        bundleID: String,
        productID: String,
        subscriptionGroupIdentifier: String,
        quantity: Int,
        transactionType: StoreAPITransaction.TransactionType,
        inAappOwnershipType: StoreAPITransaction.InAappOwnershipType,
        environment: StoreAPIEnvironment,
        purchaseDate: Int,
        originalPurchaseDate: Int,
        expiresDate: Int,
        signedDate: Int
    ) {
        self.transactionID = transactionID
        self.originalTransactionID = originalTransactionID
        self.webOrderLineItemID = webOrderLineItemID
        self.bundleID = bundleID
        self.productID = productID
        self.subscriptionGroupIdentifier = subscriptionGroupIdentifier
        self.quantity = quantity
        self.transactionType = transactionType
        self.inAappOwnershipType = inAappOwnershipType
        self.environment = environment
        self._purchaseDate = purchaseDate
        self._originalPurchaseDate = originalPurchaseDate
        self._expiresDate = expiresDate
        self._signedDate = signedDate
    }

    public init(
        transactionID: String,
        originalTransactionID: String,
        webOrderLineItemID: String,
        bundleID: String,
        productID: String,
        subscriptionGroupIdentifier: String,
        quantity: Int,
        transactionType: StoreAPITransaction.TransactionType,
        inAappOwnershipType: StoreAPITransaction.InAappOwnershipType,
        environment: StoreAPIEnvironment,
        purchaseDate: Date,
        originalPurchaseDate: Date,
        expiresDate: Date,
        signedDate: Date
    ) {
        self.init(
            transactionID: transactionID,
            originalTransactionID: originalTransactionID,
            webOrderLineItemID: webOrderLineItemID,
            bundleID: bundleID,
            productID: productID,
            subscriptionGroupIdentifier: subscriptionGroupIdentifier,
            quantity: quantity,
            transactionType: transactionType,
            inAappOwnershipType: inAappOwnershipType,
            environment: environment,
            purchaseDate: Int(purchaseDate.timeIntervalSince1970),
            originalPurchaseDate: Int(originalPurchaseDate.timeIntervalSince1970),
            expiresDate: Int(expiresDate.timeIntervalSince1970),
            signedDate: Int(signedDate.timeIntervalSince1970)
        )
    }

    public enum TransactionType: Codable, Hashable {
        case autoRenewableSubscription
        case nonConsumable
        case consumable
        case nonRenewingSubscription

        enum CodingKeys: String, CodingKey {
            case autoRenewableSubscription = "Auto-Renewable Subscription"
            case nonConsumable = "Non-Consumable"
            case consumable = "Consumable"
            case nonRenewingSubscription = "Non-Renewing Subscription"
        }
    }

    public enum InAappOwnershipType: Codable, Hashable {
        case familyShared
        case purchased

        enum CodingKeys: String, CodingKey {
            case familyShared = "FAMILY_SHARED"
            case purchased = "PURCHASED"
        }
    }

    public var purchaseDate: Date {
        Date(timeIntervalSince1970: TimeInterval(_purchaseDate))
    }

    public var originalPurchaseDate: Date {
        Date(timeIntervalSince1970: TimeInterval(_originalPurchaseDate))
    }

    public var expiresDate: Date {
        Date(timeIntervalSince1970: TimeInterval(_expiresDate))
    }

    public var signedDate: Date {
        Date(timeIntervalSince1970: TimeInterval(_signedDate))
    }

    enum CodingKeys: String, CodingKey {
        case transactionID = "transaction_id"
        case originalTransactionID = "original_transaction_id"
        case webOrderLineItemID = "web_order_line_item_id"
        case bundleID = "bundle_id"
        case productID = "product_id"
        case subscriptionGroupIdentifier = "subscription_group_identifier"
        case quantity
        case transactionType = "type"
        case inAappOwnershipType = "in_app_ownership_type"
        case environment
        case _purchaseDate = "purchase_date"
        case _originalPurchaseDate = "original_purchase_date"
        case _expiresDate = "expires_date"
        case _signedDate = "signed_date"
    }
}
