//
//  PaywallBuilder.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 17.11.2022.
//

import Foundation

public class PaywallBuilder {
    
    public private(set) var apiKey: String = ""
    public private(set) var apiClient: String = ""
    
    public init() {
        
    }
    
    public func setApiKey(_ apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func setApiClient(_ apiClient: String) {
        self.apiClient = apiClient
    }
    
    public func build() {
        print("Api key - \(self.apiKey)")
        print("Api client - \(self.apiClient)")
    }
}

public struct PaywallCredentials {
    public let apiKey: String
    public let apiClient: String
}

class GlobalPaywallCredentials {
    
    static let instance = GlobalPaywallCredentials()
    
    private init() {
        
    }
    var apikey : Bool = false
    var api : Bool = false
}

