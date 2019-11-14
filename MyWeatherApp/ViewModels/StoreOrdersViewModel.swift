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
    @Published var receiptResult : String!
    
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
    
    var orderNumber: String = ""
    func receipt() {
        if let orderNumber = self.orderNumber.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            receiptOrder(orderNumber: orderNumber)
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
    
    private func receiptOrder(orderNumber: String) {
        let orderLine = OrderLine(partNumber: "APPIP11256GBGRY", serialNumber: "SERAPP123455", quantity: 1)
        let storeOrder = StoreOrder(storeId: "SR001", orderNumber: orderNumber, storeOrderItems: [orderLine])
        self.gatewayClient.receiptOrder(storeOrder: storeOrder) { (result, error) in
            if let result = result {
                DispatchQueue.main.async {
                    self.receiptResult = result
                }
            }
        }
    }
}
