//
//  OrderDetailsService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import Foundation

class OrderDetailsService{
    static var orderDetailsServiceInstance = OrderDetailsService()
    
    func getCheckoutData() -> [CartItemViewModel]{
        var checkoutItems : [CartItemViewModel] = []
        
        if CurrentUser.currentUser.name != nil{
            let checkoutItemsModel = DBHelperUser.dbHelperUser.getCartItems(username: CurrentUser.currentUser.name!)
            for checkoutItem in checkoutItemsModel {
                if checkoutItem.productID != nil{
                    let currentProduct = ProductHelper.productHelper.getProductByID(productID: checkoutItem.productID!)
                    checkoutItems.append(CartItemViewModel(productID: currentProduct.productID, name: currentProduct.name, price: currentProduct.price, icon: currentProduct.images))
                }
            }
        }
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

