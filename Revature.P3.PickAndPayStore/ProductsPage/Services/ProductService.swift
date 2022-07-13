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
        
        if(productID.contains("local-")){
            let temPoduct = ProductHelper.productHelper.getProductByID(productID: productID)
            productViewModel.title = temPoduct.name
            productViewModel.rating = temPoduct.rating
            productViewModel.description = temPoduct.productDescription
            productViewModel.seller = temPoduct.seller
            productViewModel.price = temPoduct.price
            productViewModel.mainImage = UIImage(named: temPoduct.images)!
            productViewModel.images.append(UIImage(named: temPoduct.images)!)
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
            self.productViewModel = ProductViewModel(id: product.id!, title: product.title!, description: product.desc!, seller: product.seller!, rating: product.rating!, mainImage: UIImage(data: product.iconUrl)!, images: tempImages, price: product.price!)
            
            print("completed creating product")
            self.updateProduct?()
        }
            
        }
        
    }
}
