//
//  CheckoutItem.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import Foundation

struct CheckoutItem : Identifiable{
    var id = UUID()
    var name : String
    var price : Float
}
