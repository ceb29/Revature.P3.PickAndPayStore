//
//  ItemHistory+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//
//

import Foundation
import CoreData


extension ItemHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemHistory> {
        return NSFetchRequest<ItemHistory>(entityName: "ItemHistory")
    }

    @NSManaged public var date: Date?
    @NSManaged public var productID: String?
    @NSManaged public var user: User?

}

extension ItemHistory : Identifiable {

}
