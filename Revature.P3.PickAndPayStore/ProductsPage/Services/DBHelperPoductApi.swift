//
//  DBHelperPoductApi.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/14/22.
//

import Foundation
import UIKit
import CoreData
import SwiftUI

class DBHelperProductApi{
    static let dBHelperProductApi = DBHelperProductApi()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addProductApiItem(username: String, productID: String, title: String, rating: String, price: String, image: Data){
        let user = DBHelperUser.dbHelperUser.getOne(username: username)
        do{
            if context != nil{
                let productApiItem = APIProduct(context: context!)
                productApiItem.productId = productID
                productApiItem.title = title
                productApiItem.price = price
                productApiItem.image = image
                productApiItem.user = user
                user.addToApiProduct(productApiItem)
                try context?.save()
            }
        }
        catch{
            print(dBHProductApiError.dBHPAEfailedToAddItem)
        }
    }
    
    func getProductApiList(username: String) -> [APIProduct]{
        let user = DBHelperUser.dbHelperUser.getOne(username: username)
        let productList = user.apiProduct?.allObjects as! [APIProduct]
        return productList
    }
    
    func getProductApiItem(productID: String) -> Result<APIProduct, Error>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "APIProduct")
        fetchRequest.predicate = NSPredicate(format : "productId == %@", productID)
        fetchRequest.fetchLimit = 1
        guard let productApiItem = (try? context!.fetch(fetchRequest))?.first as? APIProduct else{
            print("")
            return .failure(dBHProductApiError.dBHPAEfailedToGetItem)
        }
        return .success(productApiItem)
    }
    
    func deleteProductApiItem(productID : String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "APIProduct")
        fetchRequest.predicate = NSPredicate(format : "productId == %@", productID)
        do{
            let productApiItem = try context?.fetch(fetchRequest)
            if productApiItem?.first != nil{
                context?.delete(productApiItem?.first as! APIProduct)
                try context?.save()
            }
        }
        catch{
            print(dBHProductApiError.dBHPAEfailedToDeleteItem)
        }
    }
    
    enum dBHProductApiError: Error{
        case dBHPAEfailedToDeleteItem
        case dBHPAEfailedToAddItem
        case dBHPAEfailedToGetItem
    }
    
    
}
