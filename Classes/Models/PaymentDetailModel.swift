//
//  PaymentDetailModel.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public struct PaymentDetailModel: Decodable {
    public var Amount: Float?
    public var MerchantUniqueCode: String?
    public var CurrencyId: Int?
    public var MerchantSuccessBackUrl: String?
    public var MerchantFailBackUrl: String?
    public var Installement: Int?
    public init(Amount: Float? = nil, MerchantUniqueCode: String? = nil, CurrencyId: Int? = nil, MerchantSuccessBackUrl: String? = nil, MerchantFailBackUrl: String? = nil, Installement: Int? = nil) {
        self.Amount = Amount
        self.MerchantUniqueCode = MerchantUniqueCode
        self.CurrencyId = CurrencyId
        self.MerchantSuccessBackUrl = MerchantSuccessBackUrl
        self.MerchantFailBackUrl = MerchantFailBackUrl
        self.Installement = Installement
    }
}
