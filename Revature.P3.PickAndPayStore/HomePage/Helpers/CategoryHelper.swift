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
    ]
    
    private init(){
        
    }
}
