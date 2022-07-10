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
    }
    
    var promos : [newPromo] = [
        newPromo(image: "xbox1"),
        newPromo(image: "purinaBeneful_v2"),
        newPromo(image: "xbox1"),
        newPromo(image: "purinaBeneful_v2"),
        newPromo(image: "xbox1")
    ]
    
    //does storing in cored data even make sense for promos
    func addProducts(){
        //add to core data
    }
}
