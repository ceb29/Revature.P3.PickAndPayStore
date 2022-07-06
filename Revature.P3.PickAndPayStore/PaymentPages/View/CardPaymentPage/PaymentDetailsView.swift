//
//  PaymentDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct PaymentDetailsView : View{
    @Binding var cardNumber : String
    @Binding var expirationMonth : String
    @Binding var expirationYear : String
    @Binding var securityCode : String

    var body: some View{
        VStack{
            PaymentTextFieldView(label: "CardNumber", labelWidth: 130, placeholder: "0000-1111-2222-3333", content: $cardNumber)
            HStack{
                Text("Expiration Date")
                    .frame(width: 130)
                TextField("MM", text: $expirationMonth)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, height: 10)
                TextField("YY", text: $expirationYear)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
            }
                .padding(.trailing, 5)
            PaymentTextFieldView(label: "Security Code", labelWidth: 130, placeholder: "012", content: $securityCode)
        }
        .padding()
    }
}
