//
//  HomeSearchHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/16/22.
//

import Foundation

class HomeSearchHelper{
    static var helper = HomeSearchHelper()
    var lastResults : [String] = []
    private init(){
        
    }
    
    
    func search(searchText: String) -> [String]{
        let products = HomeRecommendedService.sharedInstance.getData()
        var results : [String] = []
        for i in 0..<products.count{
            if products[i].name.lowercased().contains(searchText.lowercased()){
                results.append(products[i].productID)
            }
        }
        if results.count == 0{
            return lastResults
        }
        lastResults = results
        return results
    }
    
    func searchWithRegex(searchText: String) -> [String]{
        let products = HomeRecommendedService.sharedInstance.getData()
        var results : [String] = []
        let regex = "\\b" + NSRegularExpression.escapedPattern(for: searchText.lowercased())
        for i in 0..<products.count{
            if products[i].name.lowercased().range(of: regex, options: .regularExpression) != nil{
                results.append(products[i].productID)
            }
        }
        if results.count == 0{
            return lastResults
        }
        lastResults = results
        return results
    }
    
    func searchWithPrefix(searchText: String) -> [String]{
        let products = HomeRecommendedService.sharedInstance.getData()
        var results : [String] = []
        for i in 0..<products.count{
            if products[i].name.lowercased().hasPrefix(searchText.lowercased()){
                results.append(products[i].productID)
            }
        }
        return results
    }
    
    func searchWithPartial(searchText: String) -> [String]{
        let products = HomeRecommendedService.sharedInstance.getData()
        var currentMax = 0
        var searchDict : [String : Int] = [:]
        var currentString = ""
        var searchResults : [String] = []
        for char in searchText{
            currentString += String(char)
            for i in 0..<products.count{
                if products[i].name.lowercased().contains(currentString.lowercased()){
                    if searchDict[products[i].productID] != nil{
                        searchDict[products[i].productID] = searchDict[products[i].productID]! + 1
                    }
                    else{
                        searchDict[products[i].productID] = 1
                    }
                }
            }
        }
        for (str, cnt) in searchDict{
            if cnt >= currentMax{
                searchResults.insert(str, at: 0)
                currentMax = cnt
            }
            else{
                searchResults.append(str)
            }
        }
        return searchResults
    }
    
    
    
}
