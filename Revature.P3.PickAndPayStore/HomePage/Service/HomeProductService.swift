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
        let productModelData = [ProductModel(name : "test", image: "img1"), ProductModel(name : "test", image: "img1"), ProductModel(name : "test", image: "img1")]
        var productViewModelData : [HomeProduct] = []
        
        for product in productModelData{
            productViewModelData.append(HomeProduct(name: product.name, image: product.image))
        }
        return productViewModelData
    }
}
