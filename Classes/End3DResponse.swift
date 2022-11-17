//
//  End3DResponse.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 17.11.2022.
//

import Foundation
public struct End3DResponse: Decodable {
    var ErrorCode: Int?
    var Result: Bool?
    var Message: String?
    var Body: String?
}
