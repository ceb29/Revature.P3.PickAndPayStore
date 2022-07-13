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
    
    func run() {
        
        // any search query....
        //spaces must be replaced by +...
        
        let url = "https://api.rainforestapi.com/request?api_key=EC521707AB464E8BB2077A4B2184F915&type=search&amazon_domain=amazon.com&search_term=\(getSearchProduct())"
        print(url)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            print("worked")
            let items = json["search_results"].array!
            for i in items{


                
                let title = i["title"].stringValue
                
                guard (i["prices"].array?.count) != nil else{
                    print("has failed to find price")
                    continue
                }
                
                
                let price = i["prices"][0]["raw"].stringValue
  
                let rating = i["rating"].stringValue
                let id = i["asin"].stringValue
                
                guard let icon = i["image"].url else{
                    print("icon has failed to load")
                    continue
                }
                let iconData = try! Data(contentsOf: icon)
                
                self.searchProduct.append(SearchProductApi(id: id, rating: rating, title: title, price: price, iconUrl: iconData))
            }
            print(self.searchProduct.count)
            self.updateProduct?()
            self.searchProduct = [SearchProductApi]()
        }.resume()
        
    }
}
struct SearchProductApi{
 
    var id = JSON("").string
    var rating = JSON("").string
    var title = JSON("").string
    var price = JSON("").string
    var iconUrl = Data()
}
