//
//  WeatherClientOperations.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 10/12/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

extension WeatherClient {
    
    func getWeather(city: String, completion: @escaping (_ result: WeatherResponse?, _ error: Error?) -> Void) {
        
        let parameters = [
            WeatherClient.WeatherParameterKeys.QueryKey  : city,
            WeatherClient.WeatherParameterKeys.APIKey    : WeatherClient.WeatherParameterValues.APIKey
            ] as [String : Any]
        
      _ = taskForGETMethod(parameters: parameters as [String : AnyObject]) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                let userInfo = [NSLocalizedDescriptionKey: "Data retrieval failed"]
                completion(nil, NSError(domain: "taskForGetMethod", code: 1, userInfo: userInfo))
                return
            }
            do {
                let weatherParser = try JSONDecoder().decode(WeatherResponse.self, from: data )
                completion(weatherParser, nil)
            } catch {
                print("\(#function) error: \(error)")
                completion(nil, error)
            }
        }
    }
}
