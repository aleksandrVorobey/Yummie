//
//  ApiResponse.swift
//  Yummie
//
//  Created by admin on 06.06.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
