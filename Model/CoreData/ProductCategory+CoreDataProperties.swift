//
//  ProductCategory+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//
//

import Foundation
import CoreData


extension ProductCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductCategory> {
        return NSFetchRequest<ProductCategory>(entityName: "ProductCategory")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?

}

extension ProductCategory : Identifiable {

}
