//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by admin on 03.06.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var sliders = [OnboardingSlide]()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == sliders.count - 1 {
                nextBtn.setTitle("Get started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        sliders = [OnboardingSlide(title: "Delicious Dishes", descriptoion: "Experience a variety of amazing dishes from different cultures around the world.", image: "slide2"),
                   OnboardingSlide(title: "World-Class Chefs", descriptoion: "Our dishes are prepared by only the best.", image: "slide1"),
                   OnboardingSlide(title: "Instant World-Wide Delivery", descriptoion: "Your orders will be delivered instantly irrespective of your location around the world.", image: "slide3")]
        pageControl.numberOfPages = sliders.count
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == sliders.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseId, for: indexPath) as! OnboardingCollectionViewCell
        let slide = sliders[indexPath.row]
        cell.setup(slide)
        return cell
    }}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = collectionView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
