//
//  Photos.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 10/13/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import Foundation

struct PhotosParser: DeCodable {
    let photos: Photos
}

struct Photos: DeCodable {
    let pages: Int
    let photo: [PhotoJsonParser]
}

struct PhotoParser: DeCodable {
    let url: String?
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url_n"
        case title
    }
}
