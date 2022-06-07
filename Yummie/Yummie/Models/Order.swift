//
//  Order.swift
//  Yummie
//
//  Created by admin on 06.06.2022.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
