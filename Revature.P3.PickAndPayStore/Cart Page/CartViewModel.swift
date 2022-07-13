//
//  CartViewModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/12/22.
//

import Foundation
import UIKit

class cartViewModel{
    var subTotal:Double = 0.00
    var estimatedTax:Double = 0.00
    var total:Double = 0.00
    let dialogLogin = UIAlertController(title: "Warning!", message: "You need to be logged in to place an order", preferredStyle: .alert)
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
//        return total
    }
    func recalc(){
        subTotal = 0
        estimatedTax = 0
        total = 0
    }
    func recalc(items:[CartItemViewModel]){
        var itemPrices:[Double]=[]
        subTotal = 0
        estimatedTax = 0
        total = 0
        for item in items{
            itemPrices.append(Double(item.price) ?? 0)
        }
        self.subTotal(items: itemPrices)
        self.estimateTax(subTotal: subTotal)
        self.total(subTotal: subTotal, estimatedTax: estimatedTax)
    }
}
