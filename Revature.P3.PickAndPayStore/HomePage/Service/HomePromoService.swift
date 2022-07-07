//
//  HomePromoService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/1/22.
//

import Foundation

class HomePromoService{
    static var homePromoServiceInstance = HomePromoService()
    func getData() -> [HomePromo]{
        let promoModelData = [PromoModel(image: "xbox1"), PromoModel(image: "xbox1"), PromoModel(image: "xbox1"), PromoModel(image: "xbox1"), PromoModel(image: "xbox1")]
        var promoViewModelData : [HomePromo] = []
        for product in promoModelData{
            promoViewModelData.append(HomePromo(image: product.image))
        }
        return promoViewModelData
    }
    
    
}
