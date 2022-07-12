//
//  CreateProducts.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/8/22.
//

import Foundation

class ProductHelper{
    static var productHelper = ProductHelper()
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
        //fashion
        newProduct(address: "", category: "Fashion", icon: "", images: "izod_dress_shirt", name: "Izod Dress Shirt", price: "10.50", productDescription: "", productID: "local-f00", rating: "", seller: ""),
        newProduct(address: "", category: "Fashion", icon: "", images: "izod_pants", name: "Izod Pants", price: "25.10", productDescription: "", productID: "local-f01", rating: "", seller: ""),
        newProduct(address: "", category: "Fashion", icon: "", images: "izod_polo", name: "Izod Polo", price: "22.75", productDescription: "", productID: "local-f02", rating: "", seller: ""),
        newProduct(address: "", category: "Fashion", icon: "", images: "nike_sweater", name: "Nike Sweater", price: "35.75", productDescription: "", productID: "local-f03", rating: "", seller: ""),
        newProduct(address: "", category: "Fashion", icon: "", images: "nike_backpack", name: "Nike Backpack", price: "88.99", productDescription: "", productID: "local-f04", rating: "", seller: ""),
        //electronics
        newProduct(address: "", category: "Electronics", icon: "", images: "EVGA_RTX3070", name: "EVGA RTX 3070", price: "450.00", productDescription: "", productID: "local-e00", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "ipad4", name: "Ipad Pro", price: "699.99", productDescription: "", productID: "local-e01", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "nintendoSwitch", name: "Nintendo Switch", price: "349.99", productDescription: "", productID: "local-e02", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "raspberrypi4", name: "Raspberry Pi 4", price: "98.50", productDescription: "", productID: "local-e03", rating: "", seller: ""),
        newProduct(address: "", category: "Electronics", icon: "", images: "xboxSeriesX", name: "Xbox Series X", price: "499.00", productDescription: "", productID: "local-e04", rating: "", seller: ""),
        //books
        newProduct(address: "", category: "Books", icon: "", images: "time_machine", name: "The Time Machine", price: "5.99", productDescription: "", productID: "local-g00", rating: "", seller: ""),
        newProduct(address: "", category: "Books", icon: "", images: "count_of_monte_cristo", name: "The Count of Monte Cristo", price: "5.99", productDescription: "", productID: "local-g01", rating: "", seller: ""),
        newProduct(address: "", category: "Books", icon: "", images: "three_musketeers", name: "The Three Musketeers", price: "4.99", productDescription: "", productID: "local-g02", rating: "", seller: ""),
        newProduct(address: "", category: "Books", icon: "", images: "war_of_the_worlds", name: "War of the Worlds", price: "4.99", productDescription: "", productID: "local-g03", rating: "", seller: ""),
        newProduct(address: "", category: "Books", icon: "", images: "harry_potter", name: "Harry Potter", price: "10.99", productDescription: "", productID: "local-g04", rating: "", seller: ""),
        //groceries
        newProduct(address: "", category: "Groceries", icon: "", images: "doritos", name: "Doritos", price: "10.50", productDescription: "", productID: "local-g00", rating: "", seller: ""),
        newProduct(address: "", category: "Groceries", icon: "", images: "maruchan_ramen", name: "Maruchan Ramen", price: "3.75", productDescription: "", productID: "local-g01", rating: "", seller: ""),
        newProduct(address: "", category: "Groceries", icon: "", images: "planters_peanuts", name: "Planters Peanuts", price: "2.99", productDescription: "", productID: "local-g02", rating: "", seller: ""),
        newProduct(address: "", category: "Groceries", icon: "", images: "oreos", name: "Oreos, 3 Pack", price: "7.99", productDescription: "", productID: "local-g03", rating: "", seller: ""),
        newProduct(address: "", category: "Groceries", icon: "", images: "pop_tarts", name: "Pop Tarts", price: "4.55", productDescription: "", productID: "local-g04", rating: "", seller: ""),
        //pets
        newProduct(address: "", category: "Pets", icon: "", images: "dogBed", name: "Dog Bed", price: "29.99", productDescription: "", productID: "local-p00", rating: "", seller: ""),
        newProduct(address: "", category: "Pets", icon: "", images: "kong_dog_toy", name: "Kong Dog Toy", price: "9.99", productDescription: "", productID: "local-p01", rating: "", seller: ""),
        newProduct(address: "", category: "Pets", icon: "", images: "purina_cat_food", name: "Purina Cat Food", price: "8.45", productDescription: "", productID: "local-p02", rating: "", seller: ""),
        newProduct(address: "", category: "Pets", icon: "", images: "beneful_prepared_meal", name: "Beneful Prepared Meal", price: "1.99", productDescription: "", productID: "local-p03", rating: "", seller: ""),
        newProduct(address: "", category: "Pets", icon: "", images: "cat_bed", name: "Cat Bed", price: "10.50", productDescription: "35.99", productID: "local-p04", rating: "", seller: ""),
    ]
    
    //does storing in cored data even make sense for local products and categories
    func addProducts(){
        for product in products{
            DBHelperProducts.dbHelper.addProductData(address: product.address, category: product.category, icon: product.icon, images: product.images, name: product.name, price: product.price, productDescription: product.productDescription, productID: product.productID, rating: product.rating, seller: product.seller)
        }
    }
}


