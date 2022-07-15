//
//  WishListService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Mihir Ghosh on 7/15/22.
//

import Foundation
class WishListService{
    static var wishService = WishListService()
    
    func getData() -> [WishlistItemViewModel]{
        var wishListItems : [WishlistItemViewModel] = []
        guard CurrentUser.currentUser.name != nil else{
            return wishListItems
        }
        let wishListItemsModel = DBHelperUser.dbHelperUser.getWishlist(username: CurrentUser.currentUser.name!)
        for wishListItem in wishListItemsModel{
            if wishListItem.productID != nil{
                if isLocalCheckoutItem(productID: wishListItem.productID!){
                    let currentProduct = ProductHelper.productHelper.getProductByID(productID: wishListItem.productID!)
                    wishListItems.append(WishlistItemViewModel(name: currentProduct.name, prodId: currentProduct.productID, prodPrice: currentProduct.price))
                }
                else{
                    let currentResult = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: wishListItem.productID!)
                    if case .success(let currentProduct) = currentResult{
                        wishListItems.append(WishlistItemViewModel(name: currentProduct.title ?? "", prodId: currentProduct.productId ?? "", prodPrice: removeDollarSign(price: currentProduct.price)))
                    }
                }
            }
        }
        return wishListItems
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
}
