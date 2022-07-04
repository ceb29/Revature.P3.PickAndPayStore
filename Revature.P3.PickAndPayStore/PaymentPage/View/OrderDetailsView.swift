//
//  OrderDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct OrderDetailsView : View{
    @State var orderItems : [checkoutItem] = [checkoutItem(name: "Item1", price: 105.0), checkoutItem(name: "Item2", price: 24.99), checkoutItem(name: "Item3", price: 52.50), checkoutItem(name: "Item4", price: 28.20), checkoutItem(name: "Item5", price: 85.75), checkoutItem(name: "Shipping/Handling", price: 9.99) ]
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

struct checkoutItem : Identifiable{
    var id = UUID()
    var name : String
    var price : Float
}
