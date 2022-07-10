//
//  HomeProductService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/30/22.
//

import Foundation

class HomeProductService{
    static var homeProductServiceInstance = HomeProductService()
    func getData() -> [ProductCategoryViewModel]{
        let productModelData = ProductCategoryCreator.productCategoryHelper.categories
        var productViewModelData : [ProductCategoryViewModel] = []
        
        for product in productModelData{
            productViewModelData.append(ProductCategoryViewModel(name: product.name, image: product.image))
        }
        return productViewModelData
    }
}
