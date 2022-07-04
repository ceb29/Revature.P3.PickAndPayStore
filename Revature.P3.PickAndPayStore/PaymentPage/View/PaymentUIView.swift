//
//  PaymentUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/3/22.
//

import SwiftUI

struct PaymentUIView: View {
    var body: some View {
        VStack{
            ShippingDetailsView()
            PaymentDetailsView()
            OrderDetailsView()
            PlaceOrderButtonView()
            Spacer()
        }
            .background(Image("backgroundTest1"))
    }
}

struct PaymentUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentUIView()
    }
}
