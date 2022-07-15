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
                
            }
            
            
            
        }
        return wishListItems
    }
    
    
}
