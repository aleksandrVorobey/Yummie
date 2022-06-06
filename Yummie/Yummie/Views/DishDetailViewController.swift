//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by admin on 06.06.2022.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formatedCalories
        descriptionLbl.text = dish.description
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
    }
    
}
