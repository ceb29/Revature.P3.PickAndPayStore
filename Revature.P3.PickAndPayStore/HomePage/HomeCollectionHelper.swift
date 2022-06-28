//
//  HomeCollectionHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import Foundation
import UIKit

var productData = ["test1", "test2", "test3", "test4", "test5"]
var promoData = ["img1"]
var recommendedData = ["test", "test", "test", "test"] //should recommended even be collection view

func setupHomeProductCollectionCell(_ homeProductCell : HomeProductCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
    homeProductCell.productLabel.text = productData[indexPath.item]
    //homeProductCell.productImage.image = UIImage(named: productData[indexPath.item])
    return setupRoundedCellCorners(homeProductCell)
}

func setupHomePromoCollectionCell(_ homePromoCell : HomePromoCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
    homePromoCell.promoImage.image = UIImage(named: promoData[indexPath.item])
    return setupRoundedCellCorners(homePromoCell)
}

func setupHomeRecommendedCollectionCell(_ homeRecommendedCell : HomeRecommendedCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
    homeRecommendedCell.recommendedLabel.text = recommendedData[indexPath.item]
    //homeRecommendedCell.recommendedImage.image = UIImage(named: recommendedData[indexPath.item])
    return setupRoundedCellCorners(homeRecommendedCell)
}

func setupRoundedCellCorners(_ collectionViewCell : UICollectionViewCell) -> UICollectionViewCell{
    collectionViewCell.layer.cornerRadius = 10
    collectionViewCell.layer.masksToBounds = true
    return collectionViewCell
}
