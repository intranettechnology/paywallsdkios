//
//  PaywallBuilder.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 17.11.2022.
//

import Foundation

public class PaywallBuilder: PaywallListenerProtocol {
    
    public private(set) var apiKey: String = ""
    public private(set) var apiClient: String = ""
    public var delegate : PaywallListener?
    
    public init() {
        
    }
    
    public func setApiKey(_ apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func setApiClient(_ apiClient: String) {
        self.apiClient = apiClient
    }
    
    public func getVersion() {
        let versionApi: VersionApi = VersionApi()
        versionApi.delegate = self
        DispatchQueue.main.async {
            versionApi.Version(apiKey: self.apiKey, apiClient: self.apiClient)
        }
    }
    
    public func start3D(start3DPaymentRequestModel: Start3DPaymentRequestModel) {
        let start3DApi: Start3DApi = Start3DApi()
        start3DApi.delegate = self
        DispatchQueue.main.async {
            start3DApi.Start3D(apiKey: self.apiKey, apiClient: self.apiClient, start3DPaymentRequestModel: start3DPaymentRequestModel)
        }
    }
    
    public func end3D(endPaymentRequestModel: EndPaymentRequestModel) {
        let end3DApi: End3DApi = End3DApi()
        end3DApi.delegate = self
        DispatchQueue.main.async {
            end3DApi.End3D(apiKey: self.apiKey, apiClient: self.apiClient, endPaymentRequestModel: endPaymentRequestModel)
        }
    }
    
    func OnSuccess(type: Int, response: Data?) {
        delegate?.OnSuccess(type: type, response: response)
    }
    
    func OnError(type: Int, message: String) {
        delegate?.OnError(type: type, message: message)
    }
    
}


