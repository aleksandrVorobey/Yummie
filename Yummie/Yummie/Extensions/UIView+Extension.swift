//
//  UIView+Extension.swift
//  Yummie
//
//  Created by admin on 03.06.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
}
