//
//  User+CoreDataProperties.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: Int32
    @NSManaged public var username: String?
    @NSManaged public var cartItems: NSSet?
    @NSManaged public var itemHistory: NSSet?
    @NSManaged public var wishListItem: NSSet?

}

// MARK: Generated accessors for cartItems
extension User {

    @objc(addCartItemsObject:)
    @NSManaged public func addToCartItems(_ value: CartItem)

    @objc(removeCartItemsObject:)
    @NSManaged public func removeFromCartItems(_ value: CartItem)

    @objc(addCartItems:)
    @NSManaged public func addToCartItems(_ values: NSSet)

    @objc(removeCartItems:)
    @NSManaged public func removeFromCartItems(_ values: NSSet)

}

// MARK: Generated accessors for itemHistory
extension User {

    @objc(addItemHistoryObject:)
    @NSManaged public func addToItemHistory(_ value: ItemHistory)

    @objc(removeItemHistoryObject:)
    @NSManaged public func removeFromItemHistory(_ value: ItemHistory)

    @objc(addItemHistory:)
    @NSManaged public func addToItemHistory(_ values: NSSet)

    @objc(removeItemHistory:)
    @NSManaged public func removeFromItemHistory(_ values: NSSet)

}

// MARK: Generated accessors for wishListItem
extension User {

    @objc(addWishListItemObject:)
    @NSManaged public func addToWishListItem(_ value: WishlistItem)

    @objc(removeWishListItemObject:)
    @NSManaged public func removeFromWishListItem(_ value: WishlistItem)

    @objc(addWishListItem:)
    @NSManaged public func addToWishListItem(_ values: NSSet)

    @objc(removeWishListItem:)
    @NSManaged public func removeFromWishListItem(_ values: NSSet)

}

extension User : Identifiable {

}
