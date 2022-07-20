//
//  PurchasedService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/17/22.
//

import Foundation
class PurchasedService{
    static var purchasedService = PurchasedService()
    var purchasedItems = [PurchasedItemViewModel]()
    
    func run(){
        purchasedItems = [PurchasedItemViewModel]()
       let history = DBHelperUser.dbHelperUser.getShippingHistory(username: CurrentUser.currentUser.name!)
        
        for histItems in history{
            if histItems.productID!.contains("local-"){
                let historyItem = ProductHelper.productHelper.getProductByID(productID: histItems.productID!)
                purchasedItems.append(PurchasedItemViewModel(productID: historyItem.productID, name: historyItem.name
                                                             , price: historyItem.price, image: historyItem.images, shippingInfo: histItems.shippingOption!, date: histItems.date!))
                
            }
            else{
                let result = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: histItems.productID!)
                switch result{
                case .success(let historyItem) :
                    purchasedItems.append(PurchasedItemViewModel(productID: historyItem.productId!, name: historyItem.title!
                                                                 , price: historyItem.price!, imageData: historyItem.image!, shippingInfo: histItems.shippingOption!, date: histItems.date!))
                case .failure(let error) :
                    print(error)
                }
            }
        }
        return
    }
}
