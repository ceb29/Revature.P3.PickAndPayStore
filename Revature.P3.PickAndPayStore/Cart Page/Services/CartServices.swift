//
//  CartServices.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/18/22.
//

import Foundation
import UIKit

class CartServices{
    
    static var cartServices = CartServices()
    
    var subTotal:Double = 0.00
    var estimatedTax:Double = 0.00
    var total:Double = 0.00
    let dialogLogin = UIAlertController(title: "Warning!", message: "You need to be logged in to place an order", preferredStyle: .alert)
    let acknowledge = UIAlertAction(title: "Acknowledge", style: .cancel) {(action) -> Void in}
    func subTotal (items: [Double]){
        for item in items{
        subTotal = subTotal + item
        }
    }
    func estimateTax(subTotal:Double){
        let tax = 0.06875
        estimatedTax = subTotal * tax
    }
    
    func total (subTotal:Double,estimatedTax:Double){
        total = subTotal + estimatedTax
    }
    func recalc(items:[CartItemViewModel]){
        var itemPrices:[Double]=[]
        //reset the values to zero
        subTotal = 0
        estimatedTax = 0
        total = 0
        //pull the price as a double from the CartViewModel array
        for item in items{
            itemPrices.append(Double(item.price) ?? 0)
        }
        //call the functions to calculate the subTotal tax and total amounts
        self.subTotal(items: itemPrices)
        self.estimateTax(subTotal: subTotal)
        self.total(subTotal: subTotal, estimatedTax: estimatedTax)
    }
}
