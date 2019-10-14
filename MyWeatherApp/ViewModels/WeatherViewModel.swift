//
//  WeatherViewModel.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 10/12/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation
import Combine



class WeatherViewModel: ObservableObject {
    private var weatherClient: WeatherClient!
   
    
    @Published var weatherResponse : WeatherResponse!
    
    init() {
        weatherClient = WeatherClient()
        
        weatherResponse = WeatherResponse(main: Weather())
    }
    
    var temperature : String {
        if let temp = self.weatherResponse.main.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity : String {
        if let humidity = self.weatherResponse.main.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(city: city)
        }
    }
    
    var imageURL: String = ""
    
    private func fetchWeather(city: String) {
        self.weatherClient.getWeather(city: city) { (weatherResponse, error) in
            if let weatherResponse = weatherResponse {
                DispatchQueue.main.async {
                    self.weatherResponse = weatherResponse
                }
            }
        }
    }
}
