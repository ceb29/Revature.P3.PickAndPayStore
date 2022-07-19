//
//  WishlistItemViewModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Admin on 7/19/22.
//

import Foundation

struct WishlistItemViewModel: Identifiable{
    var id = UUID()
    var name : String
    var prodId : String
    var prodPrice : String
}
