//
//  Dish.swift
//  Yummie
//
//  Created by admin on 05.06.2022.
//

import Foundation

struct Dish: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formatedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
