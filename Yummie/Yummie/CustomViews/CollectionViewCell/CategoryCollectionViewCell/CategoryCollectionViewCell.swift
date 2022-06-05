//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by admin on 04.06.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let reuseId = "CategoryCollectionViewCell"
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(category: DishCategory) {
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        categoryTitleLbl.text = category.name
    }
}
