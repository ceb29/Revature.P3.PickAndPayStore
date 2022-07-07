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
        let promoModelData = [ProductModel(name : "Xbox Series X", image: "img1"), ProductModel(name : "Nintendo Switch", image: "img1"), ProductModel(name : "RTX 3070", image: "img1"), ProductModel(name : "Doritos", image: "img1"), ProductModel(name : "Dog Bed", image: "img1"), ProductModel(name : "Raspberry Pi 4", image: "img1"), ProductModel(name : "Ipad Pro", image: "img1") ]
        var promoViewModelData : [HomeRecommended] = []
        for product in promoModelData{
            promoViewModelData.append(HomeRecommended(name: product.name, image: product.image))
        }
        return promoViewModelData
    }
}
