//
//  ProductErrors.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/18/22.
//

import Foundation

enum productError: Error{
    case pMUnreadableUrl
    case pMFailedToLoadProduct
    case pMFailedToLoadProductID
    case pMFailedToLoadCategory
    case pMFailedToLoadTitle
    case pMFailedToLoadRating
    case pMFailedToLoadPrice
    case pMFailedToLoadDescription
    case pMFailedToLoadSeller
}

enum searchProductError: Error{
    case sPMUnreadableUrl
    case sPMFailedToLoadProducts
    case sPMFailedToLoadProductsID
    case sPMFailedToLoadTitle
    case sPMFailedToLoadRating
    case sPMFailedToLoadPrice
}


