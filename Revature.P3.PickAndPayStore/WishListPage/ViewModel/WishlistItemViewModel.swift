//
//  WishlistItemViewModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Mihir Ghosh on 7/15/22.
//

import Foundation
struct WishlistItemViewModel: Identifiable{
    var id = UUID()
    
    var name : String
    var prodId : String
    var prodPrice : String
}
