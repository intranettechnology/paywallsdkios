//
//  End3DResponse.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 17.11.2022.
//

import Foundation
public struct End3DResponse: Decodable {
    public var ErrorCode: Int?
    public var Result: Bool?
    public var Message: String?
    public var Body: String?
}
