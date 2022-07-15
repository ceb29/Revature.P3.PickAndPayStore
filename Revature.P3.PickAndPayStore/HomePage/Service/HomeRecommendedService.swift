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
                    productCategories.insert(pastProduct.productID!)
                }
            }
            for historyItemID in productCategories {
                if isLocalCheckoutItem(productID: historyItemID){
                    let currentProduct = ProductHelper.productHelper.getProductByID(productID: historyItemID)
                    
                    recommendedProducts.append(HomeRecommended(name: currentProduct.name, image: currentProduct.images, productID: currentProduct.productID ))
                    
                }
                else{
                    let currentResult = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: historyItemID)
                    if case .success(let currentProduct) = currentResult{
                        recommendedProducts.append(HomeRecommended(name: currentProduct.title ?? "", image: "API", productID: currentProduct.productId ?? "", data: currentProduct.image))
                    }
                }
            }
            
        }
        
        
        
        return recommendedProducts
    }
    
    func isLocalCheckoutItem(productID: String) -> Bool{
        let product = productID.components(separatedBy: "-")
        if product[0] == "local"{
            return true
        }
        else{
            return false
        }
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
