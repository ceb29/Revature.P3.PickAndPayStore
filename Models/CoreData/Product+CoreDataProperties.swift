//
//  Product+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/30/22.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productID: String?
    @NSManaged public var category: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var icon: String?
    @NSManaged public var images: String?
    @NSManaged public var seller: String?
    @NSManaged public var rating: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var address: String?

}

extension Product : Identifiable {

}
