//
//  HomePromoService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/1/22.
//

import Foundation

class HomePromoService{
    static var homePromoServiceInstance = HomePromoService()
    
    private init(){
        
    }
    
    func getData() -> [PromoViewModel]{
        let promoModelData = PromoHelper.promoHelper.promos
        var promoViewModelData : [PromoViewModel] = []
        for product in promoModelData{
            promoViewModelData.append(PromoViewModel(image: product.image, productID: product.promoID))
        }
        return promoViewModelData
    }
    
    
}
