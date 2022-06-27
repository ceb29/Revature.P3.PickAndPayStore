//
//  HomeViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    var productData = ["test1", "test2", "test3", "test4", "test5"]
    var promoData = ["img1"]
    var recommendedData = ["test", "test", "test", "test", "test"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            return productData.count
        case "homePromos":
            return promoData.count
        default:
            return recommendedData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCell : UICollectionViewCell
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: <#T##IndexPath#>)
        case "homePromos":
            currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: <#T##IndexPath#>)
        default:
            currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: <#T##IndexPath#>)
        }
        return currentCell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
