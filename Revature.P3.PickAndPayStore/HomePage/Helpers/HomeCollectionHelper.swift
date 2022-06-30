//
//  HomeCollectionHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import Foundation
import UIKit

class HomeCollectionHelper{
    var productData = HomeProductService.homeProductServiceInstance.getData()
    //should recommended even be collection view

    func setupHomeProductCollectionCell(_ homeProductCell : HomeProductCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homeProductCell.configure(homeProduct: productData[indexPath.row])
        //homeProductCell.productImage.image = UIImage(named: productData[indexPath.item])
        return setupRoundedCellCorners(homeProductCell)
    }

    func setupHomePromoCollectionCell(_ homePromoCell : HomePromoCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        //homePromoCell.configure(homePromo: productData[indexPath.row])
        return setupRoundedCellCorners(homePromoCell)
    }
    
    func setupHomeRecommendedCollectionCell(_ homeRecommendedCell : HomeRecommendedCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        //homeRecommendedCell.configure(homeRecommended: productData[indexPath.row])
        //homeRecommendedCell.recommendedImage.image = UIImage(named: recommendedData[indexPath.item])
        return setupRoundedCellCorners(homeRecommendedCell)
    }

    func setupRoundedCellCorners(_ collectionViewCell : UICollectionViewCell) -> UICollectionViewCell{
        collectionViewCell.layer.cornerRadius = 10
        collectionViewCell.layer.masksToBounds = true
        return collectionViewCell
    }
}

