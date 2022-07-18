//
//  DBHelperProducts.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/8/22.
//

import Foundation
import UIKit
import CoreData

class DBHelperProducts{
    static var dbHelper = DBHelperProducts()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    private init(){
        
    }
    
    func addProductData(address: String, category: String, icon: String, images: String, name: String, price: String, productDescription: String, productID: String, rating: String, seller: String){
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context!) as! Product
        product.address = address
        product.category = category
        product.icon = icon
        product.images = images
        product.name = name
        product.price = price
        product.productDescription = productDescription
        product.productID = productID
        product.rating = rating
        product.seller = seller
        
        do{
            try context?.save() //saves to database
            //print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    
    func getProductsData() -> [Product]{
        var products = [Product]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        do{
            products = try context?.fetch(fetchRequest) as! [Product]
        }
        catch{
            print("can not fetch data")
        }
        return products
    }
    
    func getOneProductData(productID : String) -> (productData : Product, productFlag : Bool){
        var product = Product()
        var productExists = true
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        fetchRequest.predicate = NSPredicate(format: "productID == %@", productID)
        fetchRequest.fetchLimit = 1
        do{
            let request = try context?.fetch(fetchRequest) as! [Product]
            if request.count != 0{
                product = request.first as! Product
                productExists = true
            }
            else{
                //print("data not found")
                productExists = false
            }
        }
        catch{
            print("error")
        }
        return (product, productExists)
    }
}
