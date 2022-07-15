//
//  ShippingDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingDetailsView : View{
    @Binding var shippingDetails : ShippingDetails
    
    var body: some View{
        VStack{
            PaymentTextFieldView(label: "Zip Code", labelWidth: 80, placeholder: "", content: $shippingDetails.zipCode)
            PaymentTextFieldView(label: "Address", labelWidth: 80, placeholder: "", content: $shippingDetails.address)
            PaymentTextFieldView(label: "City", labelWidth: 80, placeholder: "", content: $shippingDetails.city)
            PaymentTextFieldView(label: "State", labelWidth: 80, placeholder: "", content: $shippingDetails.state)
            PaymentTextFieldView(label: "Country", labelWidth: 80, placeholder: "", content: $shippingDetails.country)
        }
        .padding()
    }
}
