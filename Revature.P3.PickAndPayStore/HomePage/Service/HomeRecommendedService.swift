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
        let recommendedModelData = [ProductModel(name : "Xbox Series X", image: "xboxSeriesX"), ProductModel(name : "Nintendo Switch", image: "nintendoSwitch"), ProductModel(name : "RTX 3070", image: "EVGA_RTX3070"), ProductModel(name : "Doritos", image: "doritos"), ProductModel(name : "Dog Bed", image: "dogBed"), ProductModel(name : "Raspberry Pi 4", image: "raspberrypi4"), ProductModel(name : "Ipad Pro", image: "ipad4") ]
        var recommendedViewModelData : [HomeRecommended] = []
        for product in recommendedModelData{
            recommendedViewModelData.append(HomeRecommended(name: product.name, image: product.image))
        }
        return recommendedViewModelData
    }
}
