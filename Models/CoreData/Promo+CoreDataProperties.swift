//
//  Promo+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/30/22.
//
//

import Foundation
import CoreData


extension Promo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Promo> {
        return NSFetchRequest<Promo>(entityName: "Promo")
    }

    @NSManaged public var image: String?

}

extension Promo : Identifiable {

}
