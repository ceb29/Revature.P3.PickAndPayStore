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
            PaymentTextFieldView(label: "Address", labelWidth: 80, placeholder: "", content: $shippingDetails.city)
            PaymentTextFieldView(label: "City", labelWidth: 80, placeholder: "", content: $shippingDetails.address)
            PaymentTextFieldView(label: "State", labelWidth: 80, placeholder: "", content: $shippingDetails.state)
            PaymentTextFieldView(label: "Country", labelWidth: 80, placeholder: "", content: $shippingDetails.country)
            /*Picker("Month", selection: $monthSelection){
                ForEach(MonthOption.allCases){month in
                    Text(month.rawValue)
                }
            }
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                .pickerStyle(MenuPickerStyle())
            Picker("Year", selection: $yearSelection){
                ForEach(YearOption.allCases){year in
                    Text(year.rawValue)
                }
            }
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                .pickerStyle(MenuPickerStyle())
             */
        }
        .padding()
    }
}
