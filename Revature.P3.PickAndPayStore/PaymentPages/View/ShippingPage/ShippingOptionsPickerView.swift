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
    var standardShippingText : String
    var body: some View {
        VStack{
            Text("Delivery Options")
                //font(.system(size: 30))
                //.bold()
            Picker("Shipping Options", selection: $shippingSelection) {
                Text("Standard Shipping (5-10 days): " + standardShippingText).tag(ShippingOption.standard)
                Text("Priority Shipping (3-5 days): $9.99").tag(ShippingOption.priority)
                Text("Express Shipping (1-3 days): $14.99").tag(ShippingOption.express)
            }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                .pickerStyle(MenuPickerStyle())
        }
        .padding()
    }
}
