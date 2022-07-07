//
//  ShippingOptionsPickerView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import SwiftUI

struct ShippingOptionsPickerView: View {
    //picker
    @Binding var shippingSelection: ShippingOption
    
    var body: some View {
        VStack{
            Text("Delivery Options")
                .font(.system(size: 30))
                .bold()
            VStack{
                Picker("Shipping Options", selection: $shippingSelection) {
                    Text("Standard Shipping (5-10 days): $4.99").tag(ShippingOption.standard)
                    Text("Priority Shipping (3-5 days): $9.99").tag(ShippingOption.priority)
                    Text("Express Shipping (1-3 days): $14.99").tag(ShippingOption.express)
                }
                    .padding()
                        .pickerStyle(MenuPickerStyle())
            }
            .background(.white)
            .cornerRadius(15)
            .padding()
        }
    }
}
