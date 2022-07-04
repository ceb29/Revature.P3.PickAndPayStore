//
//  PaymentDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct PaymentDetailsView : View{
    @State private var cardNumber : String = ""
    @State private var expirationMonth : String = ""
    @State private var expirationYear : String = ""
    @State private var securityCode : String = ""

    var body: some View{
        VStack{
            HStack{
                Text("Card Number")
                    .frame(width: 130)
                TextField("0000-1111-2222-3333", text: $cardNumber)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 250, height: 10)
            }
                .padding(.trailing, 5)
            
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
                    //.frame(width: 120, height: 10)
            }
                .padding(.trailing, 5)

            HStack{
                Text("Security Code")
                    .frame(width: 130)
                TextField("012", text: $securityCode)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 250, height: 10)
            }
                .padding(.trailing, 5)
        }
        //.padding(.bottom, 20)
    }
}
