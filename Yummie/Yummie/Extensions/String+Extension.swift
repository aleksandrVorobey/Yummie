//
//  String+Extension.swift
//  Yummie
//
//  Created by admin on 05.06.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
