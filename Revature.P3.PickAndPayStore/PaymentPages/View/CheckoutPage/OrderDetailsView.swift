//
//  OrderDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct OrderDetailsView : View{
    //var orderItems : [CheckoutItem] = OrderDetailsService.orderDetailsServiceInstance.getCheckoutDataWithID()
    var orderItems : [CheckoutItem]
    var shippingCost : Float
    var taxCost : Float
    var totalCost : Float
    
    init(orderItems: [CheckoutItem], shippingcost: Float, taxCost: Float, totalCost: Float){
        self.orderItems = orderItems
        self.shippingCost = shippingcost
        self.taxCost = taxCost
        self.totalCost = totalCost
        UITableView.appearance().contentInset.top = -10 //need to figure out a better way of removing top space from list
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
                        Text("Shipping")
                        Text(String(format: "$%.02f", shippingCost))
                    }
                    HStack{
                        Text("Estimated Tax")
                        Text(String(format: "$%.02f", taxCost))
                    }
                    HStack{
                        Text("Total Cost")
                        Text(String(format: "$%.02f", totalCost))
                    }
                }
            }
            .frame(height: 300)
        }
        .padding(.bottom, 5)
    }
    
    
    
}


