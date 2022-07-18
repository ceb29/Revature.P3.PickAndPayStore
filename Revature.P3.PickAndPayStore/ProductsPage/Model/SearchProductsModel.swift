//
//  SearchProductsModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/8/22.
//

import Foundation
import UIKit
import SwiftyJSON

struct SearchProductApi{
 
    var id = JSON("").string
    var rating = JSON("").string
    var title = JSON("").string
    var price = JSON("").string
    var iconUrl = Data()
}
