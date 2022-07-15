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
                    if isLocalCheckoutItem(productID: checkoutItem.productID!){
                        let currentProduct = ProductHelper.productHelper.getProductByID(productID: checkoutItem.productID!)
                        checkoutItems.append(CartItemViewModel(productID: currentProduct.productID, name: currentProduct.name, price: currentProduct.price, icon: currentProduct.images))
                    }
                    else{
                        let currentResult = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: checkoutItem.productID!)
                        if case .success(let currentProduct) = currentResult{
                            checkoutItems.append(CartItemViewModel(productID: currentProduct.productId ?? "", name: currentProduct.title ?? "", price: currentProduct.price ?? "", icon: "API", data: currentProduct.image))
                        }
                    }
                }
            }
        }
        return checkoutItems
    }
    
    func isLocalCheckoutItem(productID: String) -> Bool{
        let product = productID.components(separatedBy: "-")
        if product[0] == "local"{
            return true
        }
        else{
            return false
        }
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

