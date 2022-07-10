//
//  ProductCategoryCreator.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/10/22.
//

import Foundation

class CategoryHelper{
    static var categoryHelper = CategoryHelper()
    struct newCategory{
        var name: String
        var image: String
    }
    
    var categories : [newCategory] = [
        newCategory(name : "Fashion", image: "fashion"),
        newCategory(name : "Electronics", image: "electronics"),
        newCategory(name : "Books", image: "books"),
        newCategory(name : "Groceries", image: "groceries"),
        newCategory(name : "Pets", image: "pets"),
        newCategory(name : "Toys", image: "toys"),
        newCategory(name : "Automotive", image: "automotive")
        
    ]
    
    //does storing in cored data even make sense for local products and categories
    //on first load of app products and categories would need to be added and collections would be empty
    func addProducts(){
        //add to core data
    }
}
