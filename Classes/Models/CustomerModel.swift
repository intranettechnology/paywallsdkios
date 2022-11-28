//
//  CustomerModel.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public struct CustomerModel: Decodable {
    public var FullName: String?
    public var Phone: String?
    public var Email: String?
    public var Country: String?
    public var City: String?
    public var Address: String?
    public var IdentityNumber: String?
    public var TaxNumber: String?
    public init(FullName: String? = nil, Phone: String? = nil, Email: String? = nil, Country: String? = nil, City: String? = nil, Address: String? = nil, IdentityNumber: String? = nil, TaxNumber: String? = nil) {
        self.FullName = FullName
        self.Phone = Phone
        self.Email = Email
        self.Country = Country
        self.City = City
        self.Address = Address
        self.IdentityNumber = IdentityNumber
        self.TaxNumber = TaxNumber
    }
}
