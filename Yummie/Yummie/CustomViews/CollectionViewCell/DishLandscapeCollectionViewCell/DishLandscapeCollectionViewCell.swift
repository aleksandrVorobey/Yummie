//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by admin on 06.06.2022.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "DishLandscapeCollectionViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formatedCalories
    }

}
