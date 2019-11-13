//
//  GatewayClientConstants.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 11/13/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

extension GatewayClient {
    
    struct Constants {
        static let ApiScheme = "http"
        static let ApiHost = "localhost:8080"
        static let ApiPath = "/v1/retail/order/get/"
    }
    
    struct GatewayParameterKeys {
        static let Method = "method"
        static let Format = "format"
        static let QueryKey = "q"
    }
    
    struct GatewayParameterValues {
        static let ResponseFormat = "json"
    }
}
