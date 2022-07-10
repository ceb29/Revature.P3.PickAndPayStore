//
//  CreateProducts.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/8/22.
//

import Foundation

class ProductCreator{
    static var productHelper = ProductCreator()
    struct newProduct{
        var address: String
        var category: String
        var icon: String
        var images: String
        var name: String
        var price: String
        var productDescription: String
        var productID: String
        var rating: String
        var seller: String
    }
    
    var products : [newProduct] = [
        newProduct(address: "", category: "Pets", icon: "", images: "dogBed", name: "Dog Bed", price: "29.99", productDescription: "", productID: "x00", rating: "", seller: ""),
        newProduct(address: "", category: "Groceries", icon: "", images: "doritos", name: "Doritos", price: "10.50", productDescription: "", productID: "x01", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "EVGA_RTX3070", name: "EVGA RTX 3070", price: "450.00", productDescription: "", productID: "x02", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "ipad4", name: "Ipad Pro", price: "699.99", productDescription: "", productID: "x03", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "nintendoSwitch", name: "Nintendo Switch", price: "349.99", productDescription: "", productID: "x04", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "raspberrypi4", name: "Raspberry Pi 4", price: "98.50", productDescription: "", productID: "x05", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "xboxSeriesX", name: "Xbox Series X", price: "499.00", productDescription: "", productID: "x06", rating: "", seller: "")
    ]
    
    func addProducts(){
        for product in products{
            DBHelperProducts.dbHelper.addProductData(address: product.address, category: product.category, icon: product.icon, images: product.images, name: product.name, price: product.price, productDescription: product.productDescription, productID: product.productID, rating: product.rating, seller: product.seller)
        }
    }
}


