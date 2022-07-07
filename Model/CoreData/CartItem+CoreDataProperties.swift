//
//  CartItem+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//
//

import Foundation
import CoreData


extension CartItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItem> {
        return NSFetchRequest<CartItem>(entityName: "CartItem")
    }

    @NSManaged public var productID: String?
    @NSManaged public var user: User?

}

extension CartItem : Identifiable {

}
