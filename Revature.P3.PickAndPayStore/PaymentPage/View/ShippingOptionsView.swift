//
//  ShippingOptionsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI



struct ShippingOptionsView : View{
    //@State var deliveryItems : [deliveryItem] = [deliveryItem(name: "Standard Shipping", time: "5-10 days", price: 4.99), deliveryItem(name: "Priority Shipping", time: "3-5 days", price: 9.99), deliveryItem(name: "Express Shipping", time: "1-2 days", price: 14.99) ]
    @State var deliveryItems = ["Standard Shipping 5-10 days: $4.99", "Priority Shipping 3-5 days: $9.99" , "Express Shipping 1-2 days: 14.99"]
    
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

struct deliveryItem : Identifiable{
    var id = UUID()
    var name : String
    var time : String
    var price : Float
}
