//
//  StoreOrders.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 11/13/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

struct StoreOrderResponse : Decodable {
    let storeOrders : [StoreOrder]
}

struct StoreOrder : Decodable , Encodable {
    var storeId: String?
    var orderNumber : String?
    var storeOrderItems : [OrderLine]
}

struct OrderLine: Decodable, Encodable {
    var partNumber: String?
    var serialNumber : String?
    var quantity: Int?
}
