//
//  HomeRecommendedService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/1/22.
//

import Foundation

class HomeRecommendedService{
    static var homeRecommendedServiceInstance = HomeRecommendedService()
    func getData() -> [HomeRecommended]{
        let recommendedModelData = ProductHelper.productHelper.products
        var recommendedViewModelData : [HomeRecommended] = []
        for product in recommendedModelData{
            recommendedViewModelData.append(HomeRecommended(name: product.name, image: product.images, productID: product.productID ))
        }
        return recommendedViewModelData
    }
    
    func getRecommendedData() -> [HomeRecommended]{
        var recommendedProducts : [HomeRecommended] = []
        var productCategories = Set<String>()
        if CurrentUser.currentUser.name != nil{
            let pastProducts = DBHelperUser.dbHelperUser.getItemHistory(username: CurrentUser.currentUser.name!)
            for pastProduct in pastProducts{
                if pastProduct.productID != nil{
                    let product = ProductHelper.productHelper.getProductByID(productID: pastProduct.productID!)
                    productCategories.insert(product.productID)
                }
            }
            for category in productCategories {
                let product = ProductHelper.productHelper.getProductByID(productID: category)
                recommendedProducts.append(HomeRecommended(name: product.name, image: product.images, productID: product.productID ))
            }
            
        }
        
        
        
        return recommendedProducts
    }
    
    /*
    func getData() -> [HomeRecommended]{
        let recommendedModelData = DBHelperProducts.dbHelper.getProductsData()
        var recommendedViewModelData : [HomeRecommended] = []
        for product in recommendedModelData{
            recommendedViewModelData.append(HomeRecommended(name: product.name ?? "", image: product.images ?? ""))
            print(product.name ?? "",product.images ?? "")
        }
        return recommendedViewModelData
    }
    */
    
}
