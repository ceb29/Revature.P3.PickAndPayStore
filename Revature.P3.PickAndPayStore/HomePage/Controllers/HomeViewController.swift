//
//  HomeViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var bottomPromoImage: UIImageView!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var promoPageControl: UIPageControl!
    var homeCollectionHelper = HomeCollectionHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeView.layer.cornerRadius = 10
        welcomeView.layer.masksToBounds = true
        bottomPromoImage.image = UIImage(named: "img1") //needs to be in a view model
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            return homeCollectionHelper.productData.count
        case "homePromos":
            promoPageControl.numberOfPages = homeCollectionHelper.promoData.count
            return homeCollectionHelper.promoData.count //need to change to promodata
        default:
            return homeCollectionHelper.recommendedData.count //need to change to recommended data
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeProductCell", for: indexPath) as! HomeProductCollectionViewCell
            return homeCollectionHelper.setupHomeProductCollectionCell(currentCell, indexPath)
        case "homePromos":
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homePromoCell", for: indexPath) as! HomePromoCollectionViewCell
            return homeCollectionHelper.setupHomePromoCollectionCell(currentCell, indexPath)
        default:
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeRecommendedCell", for: indexPath) as! HomeRecommendedCollectionViewCell
            return homeCollectionHelper.setupHomeRecommendedCollectionCell(currentCell, indexPath)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        promoPageControl.currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
    }
    
}

extension HomeViewController : UISearchBarDelegate{
    
}
