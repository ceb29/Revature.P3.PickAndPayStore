//
//  HomeProductService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/30/22.
//

import Foundation

class HomeProductService{
    static var homeProductServiceInstance = HomeProductService()
    func getData() -> [ProductModel]{
        let productData = [ProductModel(name : "test", image: "img1"), ProductModel(name : "test", image: "img1"), ProductModel(name : "test", image: "img1")]
        
        return productData
    }
    
}
