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
        let getOrderApiPath = GatewayClient.Constants.GetOrderApiPath + storeId
        _ = taskForGETMethod(getOrderApiPath, nil, parameters as [String : AnyObject]) { (data, error) in
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
    
    func receiptOrder(storeOrder : StoreOrder, completion: @escaping (_ result: String?,  _ errorString: String?) -> Void) {
            
        let jsonEncoder = JSONEncoder()
        let storeOrderToReceipt = try? jsonEncoder.encode(storeOrder)
        
        let jsonBody = String(data: storeOrderToReceipt!, encoding: String.Encoding.utf8)
        let receiptOrderApiPath = GatewayClient.Constants.ReceiptOrderApiPath + storeOrder.storeId!
        let _ = taskForPOSTMethod(receiptOrderApiPath, jsonBody: jsonBody!) { (result, error) in
            
            /* 3. Send the desired value(s) to completion handler */
           if let error = error {
               print(error)
               completion(nil, "Failed to receipt order \(storeOrder).")
           } else {
               print("managed to receipt order successfully...")
           }
            completion(result as? String, nil)
        }
    }
}
