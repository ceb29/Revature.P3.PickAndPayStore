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

class ProductsModel{
    
    var updateProduct : (()->())?
    var noResults : (()->())?
    var product = ProductApi()
    var productId = ""
    var search = ""
    let json = JSON("{}")
    
    func setSearchProduct(search: String){
        self.search = search
        for val in search{
            if(val == " "){
                let index = self.search.firstIndex(of: " ")!
                self.search.remove(at: index)
                self.search.insert("+", at: index)
            }
        }
    }
    
    func setProductId(_ id : String){
        productId = id
    }
    
    
    func getSearchProduct() -> String{
        return search
    }
    
    func getProductId() -> String{
        return productId
    }
    
    
    func run() {
        
        // any search query....
        //spaces must be replaced by +...
        
        let url = "https://api.rainforestapi.com/request?api_key=EC521707AB464E8BB2077A4B2184F915&type=product&amazon_domain=amazon.com&asin=\(getProductId())"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            print("worked")
            let item = json["product"]
            


                
                let title = item["title"].stringValue
                
                guard let varient = item["variants"].array else{
                    print("failed to find a price")
                    return
                }
                var price = ""
                for item in varient{
                    if(item["is_current_product"].boolValue){
                        price = item["price"]["raw"].stringValue
                    }
                }
                
            print("still working")
                
                let category = item["categories_flat"].stringValue
                let description = item["description"].stringValue
                let rating = item["rating"].stringValue
                let id = item["asin"].stringValue
                
                guard let icon = item["main_image"]["link"].url else{
                    print("icon has failed to load")
                    return
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
                
                let seller = item["manufacturer"].stringValue
                

            print("has finished")
                
                
                self.product = ProductApi(id: id, category: category, rating: rating, title: title, price: price, iconUrl: iconData, imagesurl: images, desc: description, seller: seller)

                self.updateProduct?()
            }
        .resume()
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
