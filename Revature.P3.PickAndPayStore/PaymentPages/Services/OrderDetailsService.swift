//
//  OrderDetailsService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import Foundation

class OrderDetailsService{
    static var orderDetailsServiceInstance = OrderDetailsService()
    func getData() -> [CheckoutItem]{
        //need get data from model first
        //then use view model
        //this is just for testing UI
        let orderItems : [CheckoutItem] = [CheckoutItem(name: "Item1", price: 105.0), CheckoutItem(name: "Item2", price: 24.99), CheckoutItem(name: "Item3", price: 52.50), CheckoutItem(name: "Item4", price: 28.20), CheckoutItem(name: "Item5", price: 85.75), CheckoutItem(name: "Shipping/Handling", price: 9.99) ]

        return orderItems
    }
}
