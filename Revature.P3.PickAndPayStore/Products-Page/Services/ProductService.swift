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
    var productViewModel = ProductViewModel()
    var updateProduct : (()->())?
    
    func createProduct(){
        productModel.setProductId("B000R4EMWG")
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
