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
        static let ApiHost = "localhost"
        static let ApiPort = 8080
        static let RetailApiPath = "/v1/retail"
        static let GetOrderApiPath = "/order/get/"
        static let ReceiptOrderApiPath = "/order/receipt/"
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
