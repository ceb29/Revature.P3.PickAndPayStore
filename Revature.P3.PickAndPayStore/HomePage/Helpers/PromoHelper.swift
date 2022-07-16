//
//  PromoCreator.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/10/22.
//

import Foundation

class PromoHelper{
    static var promoHelper = PromoHelper()
    struct NewPromo{
        var image: String
        var promoID: String
    }
    
    var promos : [NewPromo] = [
        NewPromo(image: "xbox1", promoID: "local-09"),
        NewPromo(image: "purinaBeneful_v2", promoID: "local-23"),
        NewPromo(image: "xbox1", promoID: "local-09"),
        NewPromo(image: "purinaBeneful_v2", promoID: "local-23"),
        NewPromo(image: "xbox1", promoID: "local-09")
    ]
}
