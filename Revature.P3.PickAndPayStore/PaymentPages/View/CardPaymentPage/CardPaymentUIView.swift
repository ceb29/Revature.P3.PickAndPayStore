//
//  PaymentUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/3/22.
//

import SwiftUI

struct CardPaymentUIView: View {
    @State private var shippingDetails = ShippingDetails()
    @State private var paymentDetails = PaymentDetails()
    @State private var paymentFlags = PaymentFlags()
    @State private var shippingFlags = ShippingFlags()
    @State private var monthSelection: MonthOption = .Jan
    @State private var yearSelection: YearOption = .option1
    
    var body: some View {
        VStack{
            Text("Payment Details")
                .font(.system(size: 30))
                .bold()
            VStack{
                PaymentDetailsView(paymentDetails: $paymentDetails, monthSelection: $monthSelection, yearSelection: $yearSelection)
                ShippingDetailsView(shippingDetails: $shippingDetails)
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            Spacer()
            PaymentAlertView(paymentFlags: paymentFlags, shippingFlags : shippingFlags)
            PaymentPagesButtonView(label: "Place Order", action: placeOrder)
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
    func placeOrder(){
        setAlertText()
        if paymentFlags.cardNumberFlag && paymentFlags.securityCodeFlag && shippingFlags.zipCodeFlag{
            print("successfully placed order")
        }
    }
    func setAlertText(){
        let cardPaymentAlertHelper = CardPaymentAlertHelper()
        paymentFlags.placeOrderFlag = true
        paymentFlags.cardNumberFlag = cardPaymentAlertHelper.isValidCardNumber(cardNumber: paymentDetails.cardNumber)
        paymentFlags.securityCodeFlag = cardPaymentAlertHelper.isValidSecurityCode(securityCode: paymentDetails.securityCode)
        shippingFlags.zipCodeFlag = cardPaymentAlertHelper.isValidZipCode(zipCode: shippingDetails.zipCode)
    }
}

