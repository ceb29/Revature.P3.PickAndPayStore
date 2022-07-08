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
    
    func retrieveHistory(productID: String) -> ItemHistory{
        var entry = ItemHistory()
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "itemHistory")
        fetchrequest.predicate = NSPredicate(format: "title == %@", productID)
        do{
            let request = try context?.fetch(fetchrequest) as! [ItemHistory]
            if(request.count != 0){
                entry = request.first as! ItemHistory
            }
            else{
                print("entry not found")
            }
        }
        catch{
            print("Error")
        }
        return entry
    }
    
    func retrieveFullHistory() -> [ItemHistory]{
        var entry = [ItemHistory()]
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

