//
//  GatewayClientOperations.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 11/13/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

extension GatewayClient {
    
    func getOrders(storeId :  String, completion: @escaping (_ result: StoreOrderResponse?, _ error: Error?) -> Void) {
       
        let parameters =  [String:Any]()
        _ = taskForGETMethod(storeId, nil, parameters as [String : AnyObject]) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                let userInfo = [NSLocalizedDescriptionKey: "Get Orders failed"]
                completion(nil, NSError(domain: "taskForGetMethod", code: 1, userInfo: userInfo))
                return
            }
            do {
                let storeOrdersParser = try JSONDecoder().decode(StoreOrderResponse.self, from: data )
                completion(storeOrdersParser, nil)
            } catch {
                print("\(#function) error: \(error)")
                completion(nil, error)
            }
        }
    }
}
