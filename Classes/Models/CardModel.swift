//
//  CardModel.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public struct CardModel: Decodable {
    public var OwnerName: String
    public var Number: String
    public var ExpireMonth: String
    public var ExpireYear: String
    public var Cvv: String
    public var UniqueCode: String
    public init(OwnerName: String = "nil", Number: String = "nil", ExpireMonth: String = "nil", ExpireYear: String = "nil", Cvv: String = "nil", UniqueCode: String = "nil") {
        self.OwnerName = OwnerName
        self.Number = Number
        self.ExpireMonth = ExpireMonth
        self.ExpireYear = ExpireYear
        self.Cvv = Cvv
        self.UniqueCode = UniqueCode
    }
}
