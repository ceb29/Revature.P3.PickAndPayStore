//
//  CartViewModel.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/12/22.
//

import Foundation

class cartViewModel{
    var subTotal:Double = 0.00
    var estimatedTax:Double = 0.00
    var total:Double = 0.00
    func subTotal (items: [Double]){
//        var subTotal : Double = 0
        for item in items{
            subTotal = subTotal + item
        }
        self.estimateTax(subTotal:subTotal)
    }
    func estimateTax(subTotal:Double){
        let tax = 0.06875
        estimatedTax = subTotal * tax
        self.total(subTotal: subTotal, estimatedTax: estimatedTax)
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
}
