//
//  OrderDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct OrderDetailsView : View{
    var orderItems : [CheckoutItem] = OrderDetailsService.OrderDetailsServiceInstance.getData()
    
    init(){
        UITableView.appearance().contentInset.top = -25 //need to figure out a better way of removing top space from list
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View{
        Text("Order Details")
            .font(.system(size: 30))
            .bold()
        VStack{
            List{
                Section(header: Text("List of items").foregroundColor(.black), footer: Spacer(minLength: 0)){
                    ForEach(orderItems, id: \.id){ item in
                        HStack{
                            Text(item.name)
                            Text(String(format: "$%.02f", item.price))
                        }
                    }
                    HStack{
                        Text("Estimated Tax")
                        Text(String(format: "$%.02f", getTaxCost()))
                    }
                    HStack{
                        Text("Total Cost")
                        Text(String(format: "$%.02f", getTotalCost()))
                    }
                }
            }
        }
        .padding(.bottom, 5)
    }
    
    func getTotalCost() -> Float{
        var cost : Float = 0
        for item in orderItems{
            cost += item.price
        }
        cost += cost * 0.07 //getTaxCost()
        return cost
    }
    
    func getTaxCost() -> Float{
        let totalCost = getTotalCost()
        return totalCost * 0.07
    }
    
}


