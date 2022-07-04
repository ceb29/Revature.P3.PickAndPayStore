//
//  PaymentUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/3/22.
//

import SwiftUI

struct CardPaymentUIView: View {
    var body: some View {
        VStack{
            Text("Payment Details")
                .font(.system(size: 30))
                .bold()
            VStack{
                PaymentDetailsView()
                ShippingDetailsView()
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            Spacer()
            PlaceOrderButtonView()
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
