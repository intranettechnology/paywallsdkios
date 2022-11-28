//
//  End3DApi.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

class End3DApi{
    
    var delegate : PaywallListenerProtocol?
    
    public func End3D(apiKey: String, apiClient: String, endPaymentRequestModel: EndPaymentRequestModel){
        
        let url = URL(string: "\(Constants().API_URL)payment/end3d")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(apiKey)", forHTTPHeaderField: "apikeypublic")
        request.addValue("\(apiClient)", forHTTPHeaderField: "apiclientpublic")
        let json = JSONSerializer.toJson(endPaymentRequestModel)
        request.httpBody = json.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                self.delegate?.OnError(type: RequestTypes().getRequestType(type: RequestTypesEnum.End3D), message: "End3D Error took place - \(error)")
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                self.delegate?.OnError(type: RequestTypes().getRequestType(type: RequestTypesEnum.End3D), message: "No valid End3D response")
                return
            }
            
            if httpResponse.statusCode != 200 {
                self.delegate?.OnError(type: RequestTypes().getRequestType(type: RequestTypesEnum.End3D), message: "End3D NetworkHTTPStatusError - \(httpResponse.statusCode)")
            } else {
                self.delegate?.OnSuccess(type: RequestTypes().getRequestType(type: RequestTypesEnum.End3D), response: data)
            }
            
            
        }
        task.resume()
    }
}
