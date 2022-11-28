//
//  VersionApi.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

class VersionApi{
    
    var delegate : PaywallListenerProtocol?
    
    public func Version(apiKey: String, apiClient: String){
        
        let url = URL(string: "\(Constants().API_URL)payment/version")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.addValue("\(apiKey)", forHTTPHeaderField: "apikeypublic")
        request.addValue("\(apiClient)", forHTTPHeaderField: "apiclientpublic")
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                self.delegate?.OnError(type: RequestTypes().getRequestType(type: RequestTypesEnum.Version), message: "Version Error took place - \(error)")
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                self.delegate?.OnError(type: RequestTypes().getRequestType(type: RequestTypesEnum.Version), message: "No valid Version response")
                return
            }
            
            if httpResponse.statusCode != 200 {
                self.delegate?.OnError(type: RequestTypes().getRequestType(type: RequestTypesEnum.Version), message: "Version NetworkHTTPStatusError - \(httpResponse.statusCode)")
            } else {
                self.delegate?.OnSuccess(type: RequestTypes().getRequestType(type: RequestTypesEnum.Version), response: data)
            }
            
            
        }
        task.resume()
    }
}
