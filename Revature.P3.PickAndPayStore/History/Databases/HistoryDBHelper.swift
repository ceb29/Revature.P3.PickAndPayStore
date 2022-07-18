//
//  HistoryDBHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/8/22.
//

import Foundation
import UIKit
import CoreData

class HistoryDBHelper {
    
    static var histDBHandler = HistoryDBHelper()
    
    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func AddToHistory(productID: String, date: Date){
        let entry = NSEntityDescription.insertNewObject(forEntityName: "itemHistory", into: context!) as! ItemHistory
        entry.productID = productID
        entry.date = date
        do{
            try context?.save()
            print("data saved")
        }
        catch{
            print("not saved")
        }
    }
    func getOneHistoryItemData(user: User, productID : String) -> (historyData : ItemHistory, historyFlag : Bool){
        var historyItem = ItemHistory()
        var historyExists = true
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemHistory")
        fetchRequest.predicate = NSPredicate(format: "productID == %@ && user == %@", productID, user)
        fetchRequest.fetchLimit = 1
        do{
            let request = try context?.fetch(fetchRequest) as! [ItemHistory]
            if request.count != 0{
                historyItem = request.first as! ItemHistory
                historyExists = true
            }
            else{
                //print("data not found")
                historyExists = false
            }
        }
        catch{
            print("error")
        }
        return (historyItem, historyExists)
    }

    
    func retrieveFullHistory() -> [ItemHistory]{
        var entry = [ItemHistory]()
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "itemHistory")
        do{
            let request = try context?.fetch(fetchrequest) as! [ItemHistory]
            entry = request
        }
        catch{
            print("notes not found")
        }
        return entry
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
    
//    func updateNote(orig: String, title: String, body: String){
//        var entry = ItemHistory()
//        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "itemHistory")
//        fetchRequest.predicate = NSPredicate(format: "title == %@", orig)
//        do{
//            let ent = try context?.fetch(fetchRequest) as! [ItemHistory]
//            if (ent.count != 0){
//                entry = (ent.first)!
//                entry.title = title
//                entry.body = body
//                try context?.save()
//            }
//            print("saved")
//        }
//        catch{
//            print("data not overwritten")
//        }
//    }
    
//    func removeNote(title: String){
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "itemHistory")
//        print("alive")
//        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
//        print("stile alive")
//        do{
//            let entry = try context?.fetch(fetchRequest)
//            context?.delete(entry?.first as! Journal)
//            try context?.save()
//            print("data deleted")
//        }
//        catch{
//            print("error no data deleted")
//        }
//    }
}

