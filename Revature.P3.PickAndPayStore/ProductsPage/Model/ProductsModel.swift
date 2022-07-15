//
//  ProductsModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import Foundation
import UIKit
import SwiftyJSON
import WebKit
import SwiftUI

class ProductsModel{
    
    var updateProduct : (()->())?
    var noResults : (()->())?
    var product = ProductApi()
    private var productId = ""
    let json = JSON("{}")
    
    
    func setProductId(_ id : String){
        productId = id
    }
    
    func getProductId() -> String{
        return productId
    }
    
    
    func run() async -> Result<ProductApi, Error> {
        
        // any search query....
        //spaces must be replaced by +...
        
        let url = URL(string: "https://api.rainforestapi.com/request?api_key=EC521707AB464E8BB2077A4B2184F915&type=product&amazon_domain=amazon.com&asin=\(getProductId())")
        
        guard let url = url else{
            return .failure(productError.pMUnreadableUrl)
        }
        
        do
        {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let json = try! JSON(data: data)
            print("worked")
            let item = json["product"]
            
            guard let title = item["title"].string else{
                return .failure(productError.pMFailedToLoadTitle)
            }
            
            guard let id = item["asin"].string else{
                return .failure(productError.pMFailedToLoadProductID)
            }
            
            var category = item["categories_flat"].stringValue
            if(category.isEmpty){
                category = "N/A"
            }
            
            var description = item["description"].stringValue
            if(description.isEmpty){
                description = "N/A"
            }
            
            var rating =  item["rating"].stringValue
            if(rating.isEmpty){
                rating = "N/A"
            }
            
            var seller = item["manufacturer"].stringValue
            if(seller.isEmpty){
                seller = "N/A"
            }
            
            
            
            guard let varient = item["variants"].array else{
                return .failure(productError.pMFailedToLoadPrice)
            }
            var price = ""
            for item in varient{
                if(item["is_current_product"].boolValue){
                    price = item["price"]["raw"].stringValue
                }
            }
                

                
            guard let icon = item["main_image"]["link"].url else{
                return .failure(productError.pMFailedToLoadProduct)
            }
            let iconData = try! Data(contentsOf: icon)

            var images = [Data]()
            let imageCount = item["images"].count
            for x in 0...imageCount{
                guard let image = item["images"][x]["link"].url else{
                    print("image \(x) has failed to load")
                    continue
                }
                images.append(try! Data(contentsOf: image))
            }
                    
            return .success(ProductApi(id: id, category: category, rating: String(rating), title: title, price: price, iconUrl: iconData, imagesurl: images, desc: description, seller: seller))
        }
        catch{
            return .failure(productError.pMUnreadableUrl)
        }
    }
}
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
