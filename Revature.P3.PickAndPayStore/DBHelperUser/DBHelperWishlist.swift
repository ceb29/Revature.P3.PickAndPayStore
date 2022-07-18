//
//  DBHelperWishlist.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/12/22.
//

import Foundation
import UIKit
import CoreData

class DBHelperWishlist{
    static var dbHelper = DBHelperWishlist()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addWishlistData(productID : String, user : User){
        let wishlistItem = NSEntityDescription.insertNewObject(forEntityName: "WishlistItem", into: context!) as! WishlistItem
        wishlistItem.productID = productID
        wishlistItem.user = user
        do{
            try context?.save() //saves to database
            //print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    
    func getWishlistData() -> [WishlistItem]{
        var wishlistItems = [WishlistItem]()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WishlistItem")
        do{
            wishlistItems = try context?.fetch(fetchRequest) as! [WishlistItem]
        }
        catch{
            print("can not fetch data")
        }
        return wishlistItems
    }
    
    func getOneWishlistItemData(user: User, productID : String) -> (wishlistData : WishlistItem, wishlistFlag : Bool){
        var wishlistItem = WishlistItem()
        var wishlistExists = true
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WishlistItem")
        fetchRequest.predicate = NSPredicate(format: "productID == %@ && user == %@", productID, user)
        fetchRequest.fetchLimit = 1
        do{
            let request = try context?.fetch(fetchRequest) as! [WishlistItem]
            if request.count != 0{
                wishlistItem = request.first as! WishlistItem
                wishlistExists = true
            }
            else{
                //print("data not found")
                wishlistExists = false
            }
        }
        catch{
            print("error")
        }
        return (wishlistItem, wishlistExists)
    }
    
    
    func updateWishlistData(productID : String, user : String){
        var wishlistItem = WishlistItem()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WishlistItem")
        fetchRequest.predicate = NSPredicate(format: "productID == %@", productID)
        do{
            let request =  try context?.fetch(fetchRequest)
            if request?.count != 0{
                wishlistItem = request?.first as! WishlistItem
                wishlistItem.productID = productID
                try context?.save()
                //print("data updated")
            }
        }
        catch{
            print("error updating data")
        }
    }
    
    func deleteWishlestData(productID : String){
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WishlistItem")
        fetchRequest.predicate = NSPredicate(format : "productID == %@", productID)
        do{
            let wishlistItem = try context?.fetch(fetchRequest)
            if wishlistItem?.first != nil{
                context?.delete(wishlistItem?.first as! WishlistItem)
                try context?.save()
            }
        }
        catch{
            print("error deleting data")
        }
    }
    func deleteHistoryData(productID: String){
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "itemHistory")
        fetchRequest.predicate = NSPredicate(format : "productID == %@", productID)
        do{
            let historyItem = try context?.fetch(fetchRequest)
            if historyItem?.first != nil{
                context?.delete(historyItem?.first as! ItemHistory)
                try context?.save()
            }
        }
        catch{
            print("error deleting data")
        }
    }
    
}
