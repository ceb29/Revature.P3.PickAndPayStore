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
        let user = CurrentUser.currentUser.name
        guard user != nil else{
            return checkoutItems
        }
        let checkoutItemsModel = DBHelperUser.dbHelperUser.getCartItems(username: user!)
        for checkoutItemModel in checkoutItemsModel {
            guard checkoutItemModel.productID != nil else{
                continue
            }
            let checkoutItem = addCheckoutItem(productId: checkoutItemModel.productID!)
            guard checkoutItem != nil else{
                continue
            }
            checkoutItems.append(checkoutItem!)
        }
        return checkoutItems
    }
    
    func addCheckoutItem(productId: String) -> CartItemViewModel?{
        var checkoutItem : CartItemViewModel?
        if isLocalCheckoutItem(productID: productId){
            checkoutItem = addLocalItem(productID: productId)
        }
        else{
            let currentResult = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: productId)
            if case .success(let currentProduct) = currentResult{
                checkoutItem = CartItemViewModel(productID: currentProduct.productId ?? "", name: currentProduct.title ?? "", price: removeDollarSign(price: currentProduct.price), icon: "API", data: currentProduct.image)
            }
        }
        return checkoutItem
    }
    
    func addLocalItem(productID: String) -> CartItemViewModel{
        let currentProduct = ProductHelper.productHelper.getProductByID(productID: productID)
        let checkoutItem = CartItemViewModel(productID: currentProduct.productID, name: currentProduct.name, price: currentProduct.price, icon: currentProduct.images)
        return checkoutItem
    }
    
    func removeDollarSign(price: String?) -> String{
        var newPrice : String
        if price != nil{
            newPrice = price!
            if price!.contains("$"){
                newPrice.removeFirst()
            }
        }
        else{
            newPrice = ""
        }
        return newPrice
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

