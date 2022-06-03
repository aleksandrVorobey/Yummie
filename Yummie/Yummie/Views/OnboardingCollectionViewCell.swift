//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by admin on 03.06.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    static let reuseId = "OnboardingCollectionViewCell"
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = UIImage(named: slide.image)
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.descriptoion
    }
}
