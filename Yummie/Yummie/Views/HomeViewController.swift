//
//  HomeViewController.swift
//  Yummie
//
//  Created by admin on 04.06.2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        
        ProgressHUD.show()
        registerCells()
        NetworkService.shared.fetchAllCategories {[weak self] result in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib.init(nibName: CategoryCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        popularCollectionView.register(UINib.init(nibName: DishPortraitCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.reuseId)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.reuseId)
    }

}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
            let category = categories[indexPath.row]
            cell.setup(category: category)
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.reuseId, for: indexPath) as! DishPortraitCollectionViewCell
            let dish = populars[indexPath.row]
            cell.setup(dish: dish)
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.reuseId, for: indexPath) as! DishLandscapeCollectionViewCell
            let dish = specials[indexPath.row]
            cell.setup(dish: dish)
            return cell
        default: return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
