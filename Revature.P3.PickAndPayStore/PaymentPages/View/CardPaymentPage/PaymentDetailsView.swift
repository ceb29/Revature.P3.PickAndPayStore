//
//  PaymentDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct PaymentDetailsView : View{
    @Binding var paymentDetails : PaymentDetails

    var body: some View{
        VStack{
            PaymentTextFieldView(label: "CardNumber", labelWidth: 130, placeholder: "0000111122223333", content: $paymentDetails.cardNumber)
            HStack{
                Text("Expiration Date")
                    .frame(width: 130)
                TextField("MM", text: $paymentDetails.expirationMonth)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, height: 10)
                TextField("YY", text: $paymentDetails.expirationYear)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
            }
                .padding(.trailing, 5)
            PaymentTextFieldView(label: "Security Code", labelWidth: 130, placeholder: "012", content: $paymentDetails.securityCode)
        }
        .padding()
    }
}
