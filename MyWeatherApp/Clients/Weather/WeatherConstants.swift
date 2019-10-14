//
//  WeatherConstants.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 10/12/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

extension WeatherClient {
    
    struct Constants {
        static let ApiScheme = "http"
        static let ApiHost = "api.openweathermap.org"
        static let ApiPath = "/data/2.5/weather"
    }
    
    struct WeatherParameterKeys {
        static let Method = "method"
        static let Format = "format"
        static let APIKey = "APPID"
        static let QueryKey = "q"
    }
    
    struct WeatherParameterValues {
        static let APIKey = "5bf119af9dcb364ae5b264b22cbf51c4"
        static let ResponseFormat = "json"
    }
}
