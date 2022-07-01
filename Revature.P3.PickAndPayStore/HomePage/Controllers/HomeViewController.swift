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
        print(1)
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            print(homeCollectionHelper.productData.count)
            return homeCollectionHelper.productData.count
        case "homePromos":
            return homeCollectionHelper.productData.count //need to change to promodata
        default:
            return homeCollectionHelper.productData.count //need to change to recommended data
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
}

extension HomeViewController : UISearchBarDelegate{
    
}
