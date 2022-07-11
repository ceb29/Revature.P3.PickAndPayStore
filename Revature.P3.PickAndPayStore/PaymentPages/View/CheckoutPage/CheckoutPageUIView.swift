//
//  CheckoutPageUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct CheckoutPageUIView: View {
    var body: some View {
        NavigationView{
            VStack{
                OrderDetailsView()
                //PaymentPagesButtonView(label: "Pay With Card", action: {print("pay with card selected")})
                NavigationLink(destination: CardPaymentUIView()){
                    Text("Pay With Card")
                }
                    .frame(width: 200, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                Spacer()
            }
                .background(Image("backgroundTest1"))
            
        }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
}

struct CheckoutPageUIView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutPageUIView()
    }
}

class CheckoutHostingController: UIHostingController<ShippingDetailsUIView>{
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: ShippingDetailsUIView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
