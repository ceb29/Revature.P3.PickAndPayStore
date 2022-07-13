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
    @State private var shippingDetailsFlags = ShippingDetailsFlags()
    @State private var monthSelection: MonthOption = .Jan
    @State private var yearSelection: YearOption = .option1
    @State private var paymentSuccessful: Bool = false
    
    var body: some View {
        NavigationView{
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
                PaymentAlertView(paymentFlags: paymentFlags, shippingDetailsFlags : shippingDetailsFlags)
                if !paymentSuccessful{
                    PaymentPagesButtonView(label: "Place Order", action: placeOrder)
                }
                else{
                    Text("Payment Successful")
                }
                
                Spacer()
            }
                .background(Image("backgroundTest1"))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
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
        if paymentFlags.cardNumberFlag && paymentFlags.securityCodeFlag && shippingDetailsFlags.zipCodeFlag && shippingDetailsFlags.addressFlag && shippingDetailsFlags.cityFlag{
            if CheckoutHistoryHelper.checkoutHistoryHelper.saveToOrderHistory(){
                paymentSuccessful = true
                //need to clear cart
                
                let itemHistory = DBHelperUser.dbHelperUser.getItemHistory(username: "a")
                for d in itemHistory{
                    print(d.productID, d.date )
                }
                print("successfully placed order")
            }
        }
    }
    func setAlertText(){
        let cardPaymentAlertHelper = CardPaymentAlertHelper()
        let shippingDetailsAlertHelper = ShippingDetailsAlertHelper()
        paymentFlags.placeOrderFlag = true
        paymentFlags.cardNumberFlag = cardPaymentAlertHelper.isValidCardNumber(cardNumber: paymentDetails.cardNumber)
        paymentFlags.securityCodeFlag = cardPaymentAlertHelper.isValidSecurityCode(securityCode: paymentDetails.securityCode)
        shippingDetailsFlags.zipCodeFlag = shippingDetailsAlertHelper.isValidZipCode(zipCode: shippingDetails.zipCode)
        shippingDetailsFlags.addressFlag = shippingDetailsAlertHelper.isValidAddress(address: shippingDetails.address)
        shippingDetailsFlags.cityFlag = shippingDetailsAlertHelper.isValidCity(city: shippingDetails.city)
    }
}

class CardPaymentHostingController: UIHostingController<ShippingDetailsUIView>{
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: ShippingDetailsUIView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
