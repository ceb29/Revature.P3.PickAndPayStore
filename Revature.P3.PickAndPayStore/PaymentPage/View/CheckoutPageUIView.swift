//
//  CheckoutPageUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct CheckoutPageUIView: View {
    var body: some View {
        VStack{
            OrderDetailsView()
            ApplePayButtonView()
            PayWithCardButtonView()
            Spacer()
        }
            .background(Image("backgroundTest1"))
    }
}

struct CheckoutPageUIView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutPageUIView()
    }
}
