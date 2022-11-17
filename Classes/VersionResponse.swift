//
//  VersionResponse.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 17.11.2022.
//

import Foundation

public struct VersionResponse: Decodable {
    var ErrorCode: Int?
    var Result: Bool?
    var Message: String?
    var Body: String?
}
