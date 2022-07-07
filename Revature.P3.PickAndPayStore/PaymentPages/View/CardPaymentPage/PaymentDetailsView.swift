//
//  PaymentDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct PaymentDetailsView : View{
    @Binding var paymentDetails : PaymentDetails
    @Binding var monthSelection: MonthOption
    @Binding var yearSelection: YearOption
    
    var body: some View{
        VStack{
            PaymentTextFieldView(label: "CardNumber", labelWidth: 130, placeholder: "0000111122223333", content: $paymentDetails.cardNumber)
            PaymentTextFieldView(label: "Security Code", labelWidth: 130, placeholder: "012", content: $paymentDetails.securityCode)
            HStack{
                Text("Expiration Date")
                    .frame(width: 130)
                Spacer()
                Picker("Month", selection: $monthSelection){
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
                Spacer()
            }
                .padding(.trailing, 5)
            
        }
        .padding()
    }
}
