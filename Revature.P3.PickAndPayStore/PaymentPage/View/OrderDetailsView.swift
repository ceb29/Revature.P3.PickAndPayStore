//
//  OrderDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct OrderDetailsView : View{
    @State var orderItems : [checkoutItem] = [checkoutItem(name: "Item1", price: 105.0), checkoutItem(name: "Item2", price: 24.99), checkoutItem(name: "Item3", price: 52.50), checkoutItem(name: "Item4", price: 28.20), checkoutItem(name: "Item5", price: 85.75) ]
    @State var totalCost : Float = 0
    init(){
        UITableView.appearance().contentInset.top = -25 //need to figure out a better way of removing top space from list
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View{
        Text("Order Details")
            .font(.system(size: 30))
        HStack{
            Text("Total Cost of Items: ")
            Text(getTotalCost())
        }
        VStack{
            List{
                Section(header: Text("List of items").foregroundColor(.black), footer: Spacer(minLength: 0)){ForEach(orderItems, id: \.id){ item in
                    HStack{
                        Text(item.name)
                        Text(String(item.price))
                    }
                }
                }
            }
            .frame(height: 215)
            //Text("Estimated Tax/Shipping Cost")
            //Text("Final Cost")
        }
        .padding(.bottom, 20)
    }
    
    func getTotalCost() -> String{
        var cost : Double = 0
        for item in orderItems{
            cost += item.price
        }
        return String(cost)
    }
}

struct checkoutItem : Identifiable{
    var id = UUID()
    var name : String
    var price : Double
}
