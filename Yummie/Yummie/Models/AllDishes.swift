//
//  AllDishes.swift
//  Yummie
//
//  Created by admin on 06.06.2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
        let populars: [Dish]?
        let specials: [Dish]?
}
