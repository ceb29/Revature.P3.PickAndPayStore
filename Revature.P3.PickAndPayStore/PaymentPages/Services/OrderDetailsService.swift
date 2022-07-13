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
    
    func getCheckoutData() -> [CartItemViewModel]{
        var checkoutItems : [CartItemViewModel] = []
        /*
        if CurrentUser.currentUser.name != nil{
            let checkoutItemsModel = DBHelperUser.dbHelperUser.getCartItems(username: CurrentUser.currentUser.name!)
            
            for checkoutItem in checkoutItemsModel {
                if checkoutItem.productID != nil{
                    let currentProduct = ProductHelper.productHelper.getProductByID(productID: checkoutItem.productID!)
                    checkoutItems.append(CartItemViewModel(productID: currentProduct.productID, name: currentProduct.name, price: currentProduct.price, icon: currentProduct.images))
                }
            }
        }
        */
        checkoutItems = [CartItemViewModel(productID: "local-f00", name: "Izod Dress Shirt", price: "10.50", icon: "izod_dress_shirt"), CartItemViewModel(productID: "local-f01", name: "Izod Pants", price: "25.10", icon: "izod_dress_shirt"),CartItemViewModel(productID: "local-f02", name: "Izod Polo", price: "22.75", icon: "izod_polo"),CartItemViewModel(productID: "local-f03", name: "Nike Sweater", price: "35.75", icon: "nike_sweater")]
        return checkoutItems
    }
    
    func getCheckoutDataWithID() -> [CheckoutItem]{
        let cartItems : [CartItemViewModel] = getCheckoutData()
        var orderItems : [CheckoutItem] = []
        
        for cartItem in cartItems {
            orderItems.append(CheckoutItem(name: cartItem.name, price: Float(cartItem.price) ?? 0))
        }
        return orderItems
    }
}

