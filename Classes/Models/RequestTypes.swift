//
//  RequestTypes.swift
//  PaywallSDKSample
//
//  Created by serkan doksöz on 28.11.2022.
//

import Foundation

public enum RequestTypesEnum {
    case Version
    case Start3D
    case End3D
}

public class RequestTypes{
    public init() {
        
    }
    public func getRequestType(type : RequestTypesEnum) -> Int{
        switch type {
        case .Version:
            return 1
        case .Start3D:
            return 2
        case .End3D:
            return 3
        }
    }
}
