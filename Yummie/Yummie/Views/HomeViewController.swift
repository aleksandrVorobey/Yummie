//
//  HomeViewController.swift
//  Yummie
//
//  Created by admin on 04.06.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
                                      .init(id: "id1", name: "Belarus Dish1", image:       "https://picsum.photos/100/200"),
                                      .init(id: "id2", name: "Belarus Dish2", image: "https://picsum.photos/100/200"),
                                      .init(id: "id3", name: "Belarus Dish3", image: "https://picsum.photos/100/200"),
                                      .init(id: "id4", name: "Belarus Dish4", image: "https://picsum.photos/100/200"),
                                      .init(id: "id5", name: "Belarus Dish5", image: "https://picsum.photos/100/200")]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "I like pizza", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "id2", name: "Pizza2", description: "I like pizza", image: "https://picsum.photos/100/200", calories: 100),
        .init(id: "id3", name: "Pizza3", description: "I like pizza", image: "https://picsum.photos/100/200", calories: 23)]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "HotDog", description: "I like hotdog", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "id2", name: "HotDog2", description: "I like hotdog2", image: "https://picsum.photos/100/200", calories: 100)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        registerCells()
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
            
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
