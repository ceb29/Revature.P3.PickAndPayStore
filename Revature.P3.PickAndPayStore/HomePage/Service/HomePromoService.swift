//
//  HomePromoService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/1/22.
//

import Foundation

class HomePromoService{
    static var homePromoServiceInstance = HomePromoService()
    func getData() -> [PromoViewModel]{
        let promoModelData = [PromoModel(image: "xbox1"), PromoModel(image: "xbox1"), PromoModel(image: "xbox1"), PromoModel(image: "xbox1"), PromoModel(image: "xbox1")]
        var promoViewModelData : [PromoViewModel] = []
        for product in promoModelData{
            promoViewModelData.append(PromoViewModel(image: product.image))
        }
        return promoViewModelData
    }
    
    
}
