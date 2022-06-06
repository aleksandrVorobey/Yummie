//
//  CardView.swift
//  Yummie
//
//  Created by admin on 05.06.2022.
//

import UIKit
import SwiftUI

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 20
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
