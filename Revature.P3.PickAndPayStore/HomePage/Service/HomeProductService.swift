//
//  HomeProductService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/30/22.
//

import Foundation

class HomeProductService{
    static var homeProductServiceInstance = HomeProductService()
    func getData() -> [HomeProduct]{
        let productModelData = [ProductModel(name : "Fashion", image: "img1"), ProductModel(name : "Electronics", image: "img1"), ProductModel(name : "Books", image: "img1"), ProductModel(name : "Groceries", image: "img1"), ProductModel(name : "Pets", image: "img1"), ProductModel(name : "Toys", image: "img1"), ProductModel(name : "Automotive", image: "img1") ]
        var productViewModelData : [HomeProduct] = []
        
        for product in productModelData{
            productViewModelData.append(HomeProduct(name: product.name, image: product.image))
        }
        return productViewModelData
    }
}
