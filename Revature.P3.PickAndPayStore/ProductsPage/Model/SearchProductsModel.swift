//
//  SearchProductsModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/8/22.
//

import Foundation
import UIKit
import SwiftyJSON
import WebKit

class SearchProductsModel{
    
    var updateProduct : (()->())?
    var noResults : (()->())?
    var searchProduct = [SearchProductApi]()
    private var search = ""
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
    
    func getSearchProduct() -> String{
        return search
    }
    
    func run() async -> Result<[SearchProductApi], Error> {
        
        // any search query....
        //spaces must be replaced by +...
        
        let url = URL(string: "https://api.rainforestapi.com/request?api_key=EC521707AB464E8BB2077A4B2184F915&type=search&amazon_domain=amazon.com&search_term=\(getSearchProduct())")
        
        guard let url = url else{
            return .failure(searchProductError.sPMUnreadableUrl)
        }
        
        do {
        let (data, _) = try await URLSession.shared.data(from: url)
            
            let json = try! JSON(data: data)
            print("worked")
            
            
            guard let items = json["search_results"].array else{
                return .failure(searchProductError.sPMFailedToLoadProducts)
            }
            
            for i in items{

                guard let title = i["title"].string else{
                    //return .failure(searchProductError.sPMFailedToLoadTitle)
                    continue
                }
                
                guard let rating = i["rating"].float else{
                    //return .failure(searchProductError.sPMFailedToLoadRating)
                    continue
                }
                
                guard let id = i["asin"].string else{
                    //return .failure(searchProductError.sPMFailedToLoadProductsID)
                    continue
                }

                
                guard (i["prices"].array?.count) != nil else{
                    print("has failed to find price")
                    continue
                }

                let price = i["prices"][0]["raw"].stringValue

                
                guard let icon = i["image"].url else{
                    print("icon has failed to load")
                    continue
                }
                let iconData = try! Data(contentsOf: icon)
                
                self.searchProduct.append(SearchProductApi(id: id, rating: String(rating), title: title, price: price, iconUrl: iconData))
            }
            return .success(searchProduct)
        }catch{
            return .failure(searchProductError.sPMFailedToLoadProducts)
        }
        
    }
}
struct SearchProductApi{
 
    var id = JSON("").string
    var rating = JSON("").string
    var title = JSON("").string
    var price = JSON("").string
    var iconUrl = Data()
}

enum searchProductError: Error{
    case sPMUnreadableUrl
    case sPMFailedToLoadProducts
    case sPMFailedToLoadProductsID
    case sPMFailedToLoadTitle
    case sPMFailedToLoadRating
    case sPMFailedToLoadPrice
}