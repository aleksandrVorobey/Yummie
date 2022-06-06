//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by admin on 06.06.2022.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
