//
//  HomeCollectionHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import Foundation
import UIKit

class HomeCollectionHelper{
    var productData : [HomeProduct] = [HomeProduct(name : "test"), HomeProduct(name : "test"), HomeProduct(name : "test")]
    var promoData : [HomePromo] = [HomePromo(image: "img1")]
    var recommendedData : [HomeRecommended] = [HomeRecommended(name : "test"), HomeRecommended(name : "test"), HomeRecommended(name : "test")] //should recommended even be collection view

    func setupHomeProductCollectionCell(_ homeProductCell : HomeProductCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homeProductCell.productLabel.text = productData[indexPath.item].name
        //homeProductCell.productImage.image = UIImage(named: productData[indexPath.item])
        return setupRoundedCellCorners(homeProductCell)
    }

    func setupHomePromoCollectionCell(_ homePromoCell : HomePromoCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homePromoCell.promoImage.image = UIImage(named: promoData[indexPath.item].image)
        return setupRoundedCellCorners(homePromoCell)
    }

    func setupHomeRecommendedCollectionCell(_ homeRecommendedCell : HomeRecommendedCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homeRecommendedCell.recommendedLabel.text = recommendedData[indexPath.item].name
        //homeRecommendedCell.recommendedImage.image = UIImage(named: recommendedData[indexPath.item])
        return setupRoundedCellCorners(homeRecommendedCell)
    }

    func setupRoundedCellCorners(_ collectionViewCell : UICollectionViewCell) -> UICollectionViewCell{
        collectionViewCell.layer.cornerRadius = 10
        collectionViewCell.layer.masksToBounds = true
        return collectionViewCell
    }
}

