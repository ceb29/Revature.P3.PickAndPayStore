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
        let user = CurrentUser.currentUser.name
        guard CurrentUser.currentUser.name != nil else{
            return wishListItems
        }
        let wishListItemsModel = DBHelperUser.dbHelperUser.getWishlist(username: user!)
        for wishListItemModel in wishListItemsModel{
            guard wishListItemModel.productID != nil else{
                continue
            }
            let wishListItem = addWishListItem(productId: wishListItemModel.productID!)
            guard wishListItem != nil else{
                continue
            }
            wishListItems.append(wishListItem!)
            
        }
        return wishListItems
    }
    
    func addWishListItem(productId: String) -> WishlistItemViewModel?{
        var wishListItem : WishlistItemViewModel?
        if isLocalCheckoutItem(productID: productId){
            wishListItem = addLocalItem(productID: productId)
        }
        else{
            let currentResult = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: productId)
            if case .success(let currentProduct) = currentResult{
                wishListItem = WishlistItemViewModel(name: currentProduct.title ?? "", prodId: currentProduct.productId ?? "", prodPrice: currentProduct.price ?? "")
            }
        }
        return wishListItem
    }
    
    func addLocalItem(productID: String) -> WishlistItemViewModel{
        let currentProduct = ProductHelper.productHelper.getProductByID(productID: productID)
        let wishListItem = WishlistItemViewModel(name: currentProduct.name, prodId: currentProduct.productID, prodPrice: currentProduct.price)
        return wishListItem
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
