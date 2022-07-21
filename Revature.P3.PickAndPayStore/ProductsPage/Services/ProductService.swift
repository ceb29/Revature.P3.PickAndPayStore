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
    private let productModel = ProductApiService()
    private let searchModel = SearchedProductApiService()
    var productViewModel = ProductViewModel()
    var searchedProducts = [SearchProductsViewModel]()
    var updateProduct : (()->())?
    var manageErrors : (()->())?
    var updateSearchProduct : (()->())?
    var manageSearchErrors : (()->())?
    
    private var productID = String()
    
    func setID(_ id : String){
        productID = id
    }
    
    
    func multiSearchProducts(_ search: [String]){
        searchedProducts = [SearchProductsViewModel]()
        for item in search{
            searchApiData(item)
        }
    }
    
    func searchProduct(_ search: String){
        //clean out array for reuse
        searchedProducts = [SearchProductsViewModel]()
        
        //Local data
        for i in ProductHelper.productHelper.products{
            if(i.name == search || i.category == search){
                searchedProducts.append(SearchProductsViewModel(id: i.productID, title: i.name, rating: i.rating, price: i.price, icon: UIImage(named: i.images)!))
            }
        }
        //Api Data
        searchApiData(search)
    }
    
    private func searchApiData(_ search: String){
        //online data
        Task.init{
            searchModel.setSearchProduct(search: search)
        
            let results = await searchModel.run()
            switch(results){
            case .success(let products):
                for i in products{
                    self.searchedProducts.append(SearchProductsViewModel(id: i.id!, title: i.title!, rating: i.rating!, price: i.price!, icon: UIImage(data: i.iconUrl)!))
                }
                self.updateSearchProduct?()
                break
            case .failure(let error):
                self.manageSearchErrors?()
                print(error)
            }
        }
    }
    
    
    func createProduct(_ currentPrice : String = "N/A"){
        productViewModel = ProductViewModel()
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
        
            Task.init{
                productModel.setProductId(productID)
                let result = await productModel.run()
                switch(result){
                case .success(let product):
                    var tempImages = [UIImage]()
                    for i in product.imagesurl{
                        tempImages.append(UIImage(data: i)!)
                    }
                    
                    self.productViewModel = ProductViewModel(id: product.id!, title: product.title!, description: product.desc!, seller: product.seller!, rating: product.rating!, mainImage: UIImage(data: product.iconUrl)!, imageData: product.iconUrl, images: tempImages, price: product.price ?? currentPrice)
                    self.updateProduct?()
                case .failure(let error):
                    self.manageErrors?()
                    print(error)
                }
            }
        }
    }
}
