//
//  PaymentUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/3/22.
//

import SwiftUI

struct CardPaymentUIView: View {
    @State private var zipCode : String = ""
    @State private var city : String = ""
    @State private var address : String = ""
    @State private var state : String = ""
    @State private var country : String = ""
    @State private var cardNumber : String = ""
    @State private var expirationMonth : String = ""
    @State private var expirationYear : String = ""
    @State private var securityCode : String = ""
    
    var body: some View {
        VStack{
            Text("Payment Details")
                .font(.system(size: 30))
                .bold()
            VStack{
                PaymentDetailsView(cardNumber: $cardNumber, expirationMonth: $expirationMonth, expirationYear: $expirationYear, securityCode: $securityCode)
                ShippingDetailsView(zipCode: $zipCode, city: $city, address: $address, state: $state, country: $country)
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            Spacer()
            PaymentPagesButtonView(label: "Place Order", action: {print("order placed")})
            Spacer()
        }
            .background(Image("backgroundTest1"))
    }
}

struct CardPaymentUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentUIView()
    }
}
