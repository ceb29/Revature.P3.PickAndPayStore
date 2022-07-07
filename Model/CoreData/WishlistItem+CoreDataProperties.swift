//
//  WishlistItem+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//
//

import Foundation
import CoreData


extension WishlistItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishlistItem> {
        return NSFetchRequest<WishlistItem>(entityName: "WishlistItem")
    }

    @NSManaged public var productID: String?
    @NSManaged public var user: User?

}

extension WishlistItem : Identifiable {

}
