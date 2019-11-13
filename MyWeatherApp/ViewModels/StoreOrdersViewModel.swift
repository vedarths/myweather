//
//  StoreOrdersViewModel.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 11/13/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation
import Combine

class StoreOrdersViewModel: ObservableObject {
    
    private var gatewayClient: GatewayClient!
    
    @Published var storeOrders : StoreOrderResponse!
    
    init() {
        gatewayClient = GatewayClient()
        storeOrders = StoreOrderResponse(storeOrders : [StoreOrder]())
    }
    
    var storeId: String = ""
    func search() {
        if let storeId = self.storeId.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchOrders(storeId: storeId)
        }
    }
    
    
    private func fetchOrders(storeId: String) {
        self.gatewayClient.getOrders(storeId: storeId) { (storeOrders, error) in
            if let storeOrders = storeOrders {
                DispatchQueue.main.async {
                    self.storeOrders = storeOrders
                }
            }
        }
    }
}
