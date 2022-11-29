//
//  Start3DPaymentRequestModel.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public struct Start3DPaymentRequestModel: Decodable {
    public var PaymentDetail: PaymentDetailModel
    public var Card: CardModel
    public var Customer: CustomerModel
    public var Products: [ProductModel]
    
    public init(PaymentDetail: PaymentDetailModel = PaymentDetailModel(), Card: CardModel = CardModel(), Customer: CustomerModel = CustomerModel(), Products: [ProductModel] = [ProductModel()]) {
        self.PaymentDetail = PaymentDetail
        self.Card = Card
        self.Customer = Customer
        self.Products = Products
    }
}
