//
//  ProductApiService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/18/22.
//

import Foundation
import UIKit
import SwiftyJSON
import WebKit
import SwiftUI

class ProductApiService{
    
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
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = 20.0
//            sessionConfig.timeoutIntervalForResource = 20.0
            let session = URLSession(configuration: sessionConfig)
            
            
            let (data, _) = try await session.data(from: url)

            
            let json = try! JSON(data: data)
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
            var price: String? = nil
            for item in varient{
                if(item["is_current_product"].boolValue){
                    price = item["price"]["raw"].string
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
            return .failure(productError.pMFailedToLoadData)
        }
    }
}
