//
//  EndPaymentRequestModel.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public struct EndPaymentRequestModel: Decodable {
    public var MerchantUniqueCode: String
    public init(MerchantUniqueCode: String = "") {
        self.MerchantUniqueCode = MerchantUniqueCode
    }
}

