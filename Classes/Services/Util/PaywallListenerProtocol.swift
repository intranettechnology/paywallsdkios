//
//  PaywallListenerProtocol.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

protocol PaywallListenerProtocol{
    func OnSuccess(type: Int, response: Data?)
    func OnError(type : Int, message : String)
}
