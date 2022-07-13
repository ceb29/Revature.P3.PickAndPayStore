//
//  PromoCreator.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/10/22.
//

import Foundation

class PromoHelper{
    static var promoHelper = PromoHelper()
    struct newPromo{
        var image: String
        var promoID: String
    }
    
    var promos : [newPromo] = [
        newPromo(image: "xbox1", promoID: "local-09"),
        newPromo(image: "purinaBeneful_v2", promoID: "local-23"),
        newPromo(image: "xbox1", promoID: "local-09"),
        newPromo(image: "purinaBeneful_v2", promoID: "local-23"),
        newPromo(image: "xbox1", promoID: "local-09")
    ]
    
    //does storing in cored data even make sense for promos
    func addProducts(){
        //add to core data
    }
}
