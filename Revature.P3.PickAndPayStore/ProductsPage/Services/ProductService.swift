//
//  ProductService.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import Foundation
import UIKit
class ProductService{
    
    static var productService = ProductService()
    private let productModel = ProductsModel()
    private let searchModel = SearchProductsModel()
    var productViewModel = ProductViewModel()
    var searchedProducts = [SearchProductsViewModel]()
    var updateProduct : (()->())?
    
    private var productID = String()
    
    func setID(_ id : String){
        productID = id
    }
    
    func searchProduct(){
        searchModel.setSearchProduct(search: "water bottle")
        searchModel.run()
        
        searchModel.updateProduct = {
            () in
            print("is working")
            let products = self.searchModel.searchProduct
            
            for i in products{
                self.searchedProducts.append(SearchProductsViewModel(id: i.id!, title: i.title!, rating: i.rating!, price: i.price!, icon: UIImage(data: i.iconUrl)!))
                self.updateProduct?()
            }
        }
        
    }
    
    
    
    func createProduct(){
        
        if(productID.contains("locol-")){
            
        } else{
        
        productModel.setProductId(productID)
        productModel.run()
        
        productModel.updateProduct = {
            () in
            let product = self.productModel.product
            
            var tempImages = [UIImage]()
            for i in product.imagesurl{
                tempImages.append(UIImage(data: i)!)
            }
            self.productViewModel = ProductViewModel(id: product.id!, title: product.title!, description: product.desc!, seller: product.seller!, rating: product.rating!, mainImage: UIImage(data: product.iconUrl)!, images: tempImages)
            self.updateProduct?()
        }
            
        }
        
    }
}
