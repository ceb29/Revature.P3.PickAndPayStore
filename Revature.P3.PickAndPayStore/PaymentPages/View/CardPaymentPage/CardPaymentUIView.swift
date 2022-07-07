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
    @State private var cardNumberFlag : Bool = false
    @State private var securityCodeFlag : Bool = false
    @State private var zipCodeFlag : Bool = false
    @State private var placeOrderFlag : Bool = false
    
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
            PaymentAlertView(placeOrderFlag: placeOrderFlag, cardNumberFlag: cardNumberFlag, securityCodeFlag: securityCodeFlag, zipCodeFlag: zipCodeFlag)
            PaymentPagesButtonView(label: "Place Order", action: setAlertText)
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

extension CardPaymentUIView{
    func setAlertText(){
        let cardPaymentAlertHelper = CardPaymentAlertHelper()
        placeOrderFlag = true
        cardNumberFlag = cardPaymentAlertHelper.isValidCardNumber(cardNumber: cardNumber)
        securityCodeFlag = cardPaymentAlertHelper.isValidSecurityCode(securityCode: securityCode)
        zipCodeFlag = cardPaymentAlertHelper.isValidZipCode(zipCode: zipCode)
    }
}

