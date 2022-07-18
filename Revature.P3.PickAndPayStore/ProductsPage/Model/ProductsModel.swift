//
//  ProductsModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//


import Foundation
import UIKit
import SwiftyJSON

struct ProductApi{
 
    var id = JSON("").string
    var category = JSON("").string
    var rating = JSON("").string
    var title = JSON("").string
    var price = JSON("").string
    var iconUrl = Data()
    var imagesurl = [Data()]
    var desc = JSON("").string
    var seller = JSON("").string
    
}
