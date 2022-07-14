//
//  APIProduct+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/14/22.
//
//

import Foundation
import CoreData


extension APIProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<APIProduct> {
        return NSFetchRequest<APIProduct>(entityName: "APIProduct")
    }

    @NSManaged public var productId: String?
    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var image: Data?
    @NSManaged public var category: String?
    @NSManaged public var user: User?

}

extension APIProduct : Identifiable {

}
