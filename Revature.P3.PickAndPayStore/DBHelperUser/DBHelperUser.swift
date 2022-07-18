//
//  DBHelperUser.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/8/22.
//

import Foundation
import UIKit
import CoreData

class DBHelperUser {
    
    static var dbHelperUser = DBHelperUser() //accessible without a DBHelper instance
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    func isUserRegistered(username : String) -> Bool { //get one user with name
        var isUserCreated = false
        var user = User()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.fetchLimit = 1 //to fetch only the first item with the parameter "username"
        do {
            let request = try context?.fetch(fetchRequest) as! [User]
            if request.count != 0 {
                isUserCreated = true
                user = request.first as! User
            } else {
                isUserCreated = false
                print("Error: No user found.")
            }
        } catch {
            print("Error.")
        }
        return isUserCreated
    }
    
    //CRUD operations - Creation
    func createUser(nameValue : String, emailValue: String, passwordValue: String, reEnterPasswordValue: String, mobileValue: String) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.username = nameValue
        user.email = emailValue
        user.password = passwordValue
//        user.repassword = reEnterPasswordValue
        user.phoneNumber = mobileValue
        do {
            try context?.save()
            print("User data saved.")
        } catch {
            print("Error: Data not saved.")
        }
    }
    
    //function to get User for password validation
    func getOne(username : String) -> User { //get one user with name
        var user = User()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.fetchLimit = 1 //to fetch only the first item with the parameter "username"
        do {
            let request = try context?.fetch(fetchRequest) as! [User]
            if request.count != 0 {
                user = request.first as! User
            } else {
                print("Error: No user found.")
                return user
            }
        } catch {
            print("Error.")
        }
        return user
    }
    
    func addWishlist(username: String, productID: String){
        let user = getOne(username: username)
        do{
            if context != nil{
                let wishListItem = WishlistItem(context: context!)
                wishListItem.productID = productID
                wishListItem.user = user
                user.addToWishListItem(wishListItem)
                try context?.save()
            }
        }
        catch{
            print("error saving new wishlist item")
        }
    }
    
    func addCartItem(username: String, productID: String){
        let user = getOne(username: username)
        do{
            if context != nil{
                let cartItem = CartItem(context: context!)
                cartItem.productID = productID
                cartItem.user = user
                user.addToCartItems(cartItem)
                try context?.save()
            }
        }
        catch{
            print("error saving new cart item")
        }
    }
    
    func addItemHistory(username: String, productID: String, date : Date, address: String, card: String, shippingOption: String){
        let user = getOne(username: username)
        do{
            if context != nil{
                let itemHistory = ItemHistory(context: context!)
                itemHistory.productID = productID
                itemHistory.date = date
                itemHistory.address = address
                itemHistory.card = card
                itemHistory.shippingOption = shippingOption
                itemHistory.user = user
                user.addToItemHistory(itemHistory)
                try context?.save()
            }
        }
        catch{
            print("error saving new wishlist item")
        }
    }
    
    func getWishlist(username: String) -> [WishlistItem]{
        let user = DBHelperUser.dbHelperUser.getOne(username: username)
        let wishlistItem = user.wishListItem?.allObjects as! [WishlistItem]
        return wishlistItem
    }
    
    func getCartItems(username: String) -> [CartItem]{
        let user = DBHelperUser.dbHelperUser.getOne(username: username)
        let cartItem = user.cartItems?.allObjects as! [CartItem]
        return cartItem
    }
    
    func getItemHistory(username: String) -> [ItemHistory]{
        let user = DBHelperUser.dbHelperUser.getOne(username: username)
        let itemHistory = user.itemHistory?.allObjects as! [ItemHistory]
        return itemHistory
    }
    
    func deleteCartItem(username: String, productID: String){
        let user = getOne(username: username)
        let cartItem = DBHelperCheckoutItem.dbHelper.getOneCartItemData(user: user, productID: productID)
        print(cartItem)
        do{
            if context != nil{
                user.removeFromCartItems(cartItem.cartItemData)
                try context?.save()
            }
        }
        catch{
            print("error deleting new cart item")
        }
    }
    
    func deleteWishlist(username: String, productID: String){
        let user = getOne(username: username)
        let wishlistItem = DBHelperWishlist.dbHelper.getOneWishlistItemData(user: user, productID: productID)
        do{
            if context != nil{
                user.removeFromWishListItem(wishlistItem.wishlistData)
                try context?.save()
            }
        }
        catch{
            print("error deleting new cart item")
        }
    }
    func refundItem(username : String, productID: String){
        let user = getOne(username: username)
        let historyItem = HistoryDBHelper.histDBHandler.getOneProductData(productID: productID)
        do{
            if context != nil{
                user.removeFromItemHistory(historyItem.productData)
                try context?.save()
            }
        }
        catch{
            print("error deleting history item")
        }
    }
    
}
