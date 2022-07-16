//
//  DBHelperCheckoutItem.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/12/22.
//

import Foundation

import UIKit
import CoreData

class DBHelperCheckoutItem{
    static var dbHelper = DBHelperCheckoutItem()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addCartItemData(productID : String, user : User){
        let cartItem = NSEntityDescription.insertNewObject(forEntityName: "CartItem", into: context!) as! CartItem
        cartItem.productID = productID
        cartItem.user = user
        do{
            try context?.save() //saves to database
            //print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    
    func getCheckoutItemsData() -> [CartItem]{
        var cartItem = [CartItem]()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        do{
            cartItem = try context?.fetch(fetchRequest) as! [CartItem]
        }
        catch{
            print("can not fetch data")
        }
        return cartItem
    }
    
    func getOneCartItemData(user: User, productID : String) -> (cartItemData : CartItem, cartItemFlag : Bool){
        var cartItem = CartItem()
        var cartItemExists = true
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        fetchRequest.predicate = NSPredicate(format: "productID == %@ && user == %@", productID, user)
        fetchRequest.fetchLimit = 1
        do{
            let request = try context?.fetch(fetchRequest) as! [CartItem]
            if request.count != 0{
                cartItem = request.first as! CartItem
                cartItemExists = true
            }
            else{
                //print("data not found")
                cartItemExists = false
            }
        }
        catch{
            print("error")
        }
        return (cartItem, cartItemExists)
    }
    
    
    func updateCartItemData(productID : String, user : String){
        var cartItem = CartItem()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        fetchRequest.predicate = NSPredicate(format: "productID == %@", productID)
        do{
            let request =  try context?.fetch(fetchRequest)
            if request?.count != 0{
                cartItem = request?.first as! CartItem
                cartItem.productID = productID
                try context?.save()
                //print("data updated")
            }
        }
        catch{
            print("error updating data")
        }
    }
    
    func deleteCartItemData(productID : String){
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        fetchRequest.predicate = NSPredicate(format : "productID == %@", productID)
        do{
            let cartItem = try context?.fetch(fetchRequest)
            if cartItem?.first != nil{
                context?.delete(cartItem?.first as! CartItem)
            }
            try context?.save()
        }
        catch{
            print("error deleting data")
        }
    }
    
}
