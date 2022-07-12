//
//  WishHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Mihir Ghosh on 7/11/22.
//

import Foundation
import CoreData
import UIKit
class WishHelper{
    static var wishHelper = WishHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addData(productValue : String){
        
        let userWish = NSEntityDescription.insertNewObject(forEntityName: "WishlistItem", into: context!) as! WishlistItem
        
        userWish.productID = productValue
        
        do{
            try context?.save()
            print("product saved")
        }
        catch{
            print("error in product")
        }
        
    }
    
    func getData() -> [WishlistItem]{
        var userWish = [WishlistItem]()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WishlistItem")
        do{
            userWish = try context?.fetch(fetchRequest) as! [WishlistItem]
            print("Item retrieved")
        }
        catch{
            print("cannot fetch data")
        }
        return userWish
    }
    
    func deleteData(productValue : String){
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WishlistItem")
        fetchRequest.predicate = NSPredicate(format: "productID == %@", productValue)
        do{
            let userWish = try context?.fetch(fetchRequest)
            context?.delete(userWish?.first as! WishlistItem)
            try context?.save()
            print("data deleted")
        }
        catch{
            print("error in deleting")
        }
    }
    
}
