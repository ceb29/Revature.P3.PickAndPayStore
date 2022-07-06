//
//  ShippingDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingDetailsView : View{
    @Binding var zipCode : String //need to change these to @Binding
    @Binding var city : String
    @Binding var address : String
    @Binding var state : String
    @Binding var country : String
    
    var body: some View{
        
        VStack{
            PaymentTextFieldView(label: "Zip Code", labelWidth: 80, placeholder: "", content: $zipCode)
            PaymentTextFieldView(label: "Address", labelWidth: 80, placeholder: "", content: $city)
            PaymentTextFieldView(label: "City", labelWidth: 80, placeholder: "", content: $address)
            PaymentTextFieldView(label: "State", labelWidth: 80, placeholder: "", content: $state)
            PaymentTextFieldView(label: "Country", labelWidth: 80, placeholder: "", content: $country)
        }
        .padding()
    }
}
