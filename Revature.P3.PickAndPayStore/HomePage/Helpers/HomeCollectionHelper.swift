//
//  HomeCollectionHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import Foundation
import UIKit

class HomeCollectionHelper{
    static var helper = HomeCollectionHelper()
    var productData = HomeProductService.homeProductServiceInstance.getData()
    var promoData = HomePromoService.homePromoServiceInstance.getData()
    var recommendedData = HomeRecommendedService.sharedInstance.getRecommendedData()
    var guestRecommendedData = HomeRecommendedService.sharedInstance.getData() //need to use other function this is just for testing
    
    private init(){
        
    }
    
    func setupHomeProductCollectionCell(_ homeProductCell : HomeProductCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homeProductCell.configure(homeProduct: productData[indexPath.row])
        return setupRoundedCellCorners(homeProductCell)
    }

    func setupHomePromoCollectionCell(_ homePromoCell : HomePromoCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homePromoCell.configure(homePromo: promoData[indexPath.row])
        return setupRoundedCellCorners(homePromoCell)
    }
    
    func updateRecommendedData(isUserSignedIn: Bool){
        if isUserSignedIn{
            recommendedData = HomeRecommendedService.sharedInstance.getRecommendedData()
        }
        else{
            recommendedData = guestRecommendedData
        }
    }
    
    func setupHomeRecommendedCollectionCell(_ homeRecommendedCell : HomeRecommendedCollectionViewCell, _ indexPath : IndexPath) -> UICollectionViewCell{
        homeRecommendedCell.configure(homeRecommended: recommendedData[indexPath.row])
        return setupRoundedCellCorners(homeRecommendedCell)
    }

    func setupRoundedCellCorners(_ collectionViewCell : UICollectionViewCell) -> UICollectionViewCell{
        collectionViewCell.layer.cornerRadius = 10
        collectionViewCell.layer.masksToBounds = true
        return collectionViewCell
    }
    
    func setupLocalProducts(){
        let data = DBHelperProducts.dbHelper.getOneProductData(productID: "x00")
        if data.productFlag == false{
            ProductHelper.productHelper.addProducts()
        }
    }
    
}

