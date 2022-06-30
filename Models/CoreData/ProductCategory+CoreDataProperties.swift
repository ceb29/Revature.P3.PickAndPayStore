//
//  ProductCategory+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/30/22.
//
//

import Foundation
import CoreData


extension ProductCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductCategory> {
        return NSFetchRequest<ProductCategory>(entityName: "ProductCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?

}

extension ProductCategory : Identifiable {

}
