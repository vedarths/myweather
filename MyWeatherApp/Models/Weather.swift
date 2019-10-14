//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 10/12/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

struct WeatherResponse : Decodable {
    let main: Weather
}
struct Weather : Decodable {
    var temp: Double?
    var humidity: Double?
}
