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
        let productModelData = [ProductModel(name : "Fashion", image: "fashion"), ProductModel(name : "Electronics", image: "electronics"), ProductModel(name : "Books", image: "books"), ProductModel(name : "Groceries", image: "groceries"), ProductModel(name : "Pets", image: "pets"), ProductModel(name : "Toys", image: "toys"), ProductModel(name : "Automotive", image: "automotive") ]
        var productViewModelData : [ProductCategoryViewModel] = []
        
        for product in productModelData{
            productViewModelData.append(ProductCategoryViewModel(name: product.name, image: product.image))
        }
        return productViewModelData
    }
}
