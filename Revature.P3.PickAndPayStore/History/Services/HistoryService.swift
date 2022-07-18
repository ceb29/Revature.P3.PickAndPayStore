//
//  HistoryService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/18/22.
//

import Foundation

class HistoryService{
    static var historyService = HistoryService()
    func getHist() -> [HistoryItemViewModel]{
       var historyData = [HistoryItemViewModel]()
        let history = DBHelperUser.dbHelperUser.getItemHistory(username: CurrentUser.currentUser.name!)
        
        for histItems in history{
            if histItems.productID!.contains("local-"){
                let historyItem = ProductHelper.productHelper.getProductByID(productID: histItems.productID!)
                historyData.append(HistoryItemViewModel(productID: historyItem.productID, name: historyItem.name
                                                        , price: historyItem.price, image: historyItem.images, date: histItems.date!))
                
            }
            else{
                let result = DBHelperProductApi.dBHelperProductApi.getProductApiItem(productID: histItems.productID!)
                switch result{
                case .success(let historyItem) :
                    historyData.append(HistoryItemViewModel(productID: historyItem.productId!, name: historyItem.title!
                                                            , price: historyItem.price!, imageData: historyItem.image!, date: histItems.date!))
                case .failure(let error) :
                    print(error)
                }
                
                
            }
            
        }
        return historyData
    }
    
}
