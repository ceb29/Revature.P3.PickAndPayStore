//
//  ShippingOptionsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingOptionsView : View{
    var deliveryItems = ["Standard Shipping 5-10 days: $4.99", "Priority Shipping 3-5 days: $9.99" , "Express Shipping 1-2 days: 14.99"]
    
    init(){
        UITableView.appearance().contentInset.top = -35 //need to figure out a better way of removing top space from list
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View{
        VStack{
            Text("Delivery Options")
               .font(.system(size: 30))
               .bold()
            List(){
                ForEach(deliveryItems, id: \.self){ item in
                                Text(item)
                }
            }
        }
        .padding(.bottom, 5)
    }
}
