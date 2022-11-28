//
//  ProductModel.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public struct ProductModel: Decodable {
    public var ProductId: String?
    public var ProductName: String?
    public var ProductCategory: String?
    public var ProductDescription: String?
    public var ProductAmount: Float?
    public init(ProductId: String? = nil, ProductName: String? = nil, ProductCategory: String? = nil, ProductDescription: String? = nil, ProductAmount: Float? = nil) {
        self.ProductId = ProductId
        self.ProductName = ProductName
        self.ProductCategory = ProductCategory
        self.ProductDescription = ProductDescription
        self.ProductAmount = ProductAmount
    }
}
