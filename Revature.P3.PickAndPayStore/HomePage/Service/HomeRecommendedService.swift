//
//  HomeRecommendedService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/1/22.
//

import Foundation

class HomeRecommendedService{
    static var sharedInstance = HomeRecommendedService()
    
    func getData() -> [HomeRecommended]{
        let recommendedModelData = ProductHelper.productHelper.products
        var recommendedViewModelData : [HomeRecommended] = []
        for product in recommendedModelData{
            recommendedViewModelData.append(HomeRecommended(name: product.name, image: product.images, productID: product.productID ))
        }
        return recommendedViewModelData
    }
    
    func getUniqueProductIDs(user: String) -> Set<String>{
        var productCategories = Set<String>()
        let pastProducts = DBHelperUser.dbHelperUser.getItemHistory(username: user)
        for pastProduct in pastProducts{
            if pastProduct.productID != nil{
                productCategories.insert(pastProduct.productID!)
            }
        }
        return productCategories
    }
    
    func getLocalRecommendedProduct(productID: String) -> HomeRecommended{
        let currentProduct = ProductHelper.productHelper.getProductByID(productID: productID)
        let recommendedProduct = HomeRecommended(name: currentProduct.name, image: currentProduct.images, productID: currentProduct.productID )
        return recommendedProduct
    }
    
    func getRecommendedData() -> [HomeRecommended]{
        var recommendedProducts : [HomeRecommended] = []
        var productCategories = Set<String>()
        let user = CurrentUser.currentUser.name
        guard user != nil else{
            return recommendedProducts
        }
        productCategories = getUniqueProductIDs(user: user!)
        for historyItemID in productCategories {
            if isLocalCheckoutItem(productID: historyItemID){
                recommendedProducts.append(getLocalRecommendedProduct(productID: historyItemID))
            }
            else{
                let currentResult = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: historyItemID)
                if case .success(let currentProduct) = currentResult{
                    recommendedProducts.append(HomeRecommended(name: currentProduct.title ?? "", image: "API", productID: currentProduct.productId ?? "", data: currentProduct.image))
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
    
}
