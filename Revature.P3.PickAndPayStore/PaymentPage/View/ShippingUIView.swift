//
//  ShippingDetailsUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingDetailsUIView: View {
    var body: some View {
        VStack{
            Text("Shipping Details")
               .font(.system(size: 30))
               .bold()
            VStack{
                ShippingDetailsView()
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            
            ShippingOptionsView()
            Spacer()
            GoToOrderDetailsButtonView()
            Spacer()
        }
            .background(Image("backgroundTest1"))
    }
}

struct ShippingDetailsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailsUIView()
    }
}
