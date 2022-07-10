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
        let recommendedModelData = ProductCreator.productHelper.products
        var recommendedViewModelData : [HomeRecommended] = []
        for product in recommendedModelData{
            recommendedViewModelData.append(HomeRecommended(name: product.name, image: product.images ))
        }
        return recommendedViewModelData
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
