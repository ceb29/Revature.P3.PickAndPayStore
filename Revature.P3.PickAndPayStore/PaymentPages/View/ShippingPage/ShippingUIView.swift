//
//  ShippingDetailsUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import UIKit
import SwiftUI

struct ShippingDetailsUIView: View {
    @State private var shippingDetails = ShippingDetails()
    @State private var shippingSelection : ShippingOption = .standard
    @State private var shippingDetailsFlags = ShippingDetailsFlags()
    @State private var successFlag : Bool = false
    @State private var paymentDetails = PaymentDetails()
    @State private var paymentFlags = PaymentFlags()
    @State private var monthSelection: MonthOption = .Jan
    @State private var yearSelection: YearOption = .option1
    @State private var paymentSuccessful: Bool = false
    @State private var paymentText = ""
    @State private var orderItems : [CheckoutItem] = OrderDetailsService.orderDetailsServiceInstance.getCheckoutDataWithID()
    
    var body: some View {
        ScrollView{
        VStack{
            Text("Payment Details")
                .font(.system(size: 30))
                .bold()
            VStack{
                PaymentDetailsView(paymentDetails: $paymentDetails, monthSelection: $monthSelection, yearSelection: $yearSelection)
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            Text("Shipping Details")
               .font(.system(size: 30))
               .bold()
            VStack{
                ShippingDetailsView(shippingDetails: $shippingDetails)
                ShippingOptionsPickerView(shippingSelection: $shippingSelection, standardShippingText: CheckoutHistoryHelper.checkoutHistoryHelper.getShippingText(shippingSelection: shippingSelection))
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            OrderDetailsView(orderItems: orderItems, shippingcost: CheckoutHistoryHelper.checkoutHistoryHelper.getShippingCost(shippingSelection: shippingSelection), taxCost: CheckoutHistoryHelper.checkoutHistoryHelper.getTaxCost(shippingSelection: shippingSelection), totalCost: CheckoutHistoryHelper.checkoutHistoryHelper.getFinalCost(shippingSelection: shippingSelection))
                
            Text(paymentText)
                .padding()
            PaymentAlertView(paymentFlags: paymentFlags, shippingDetailsFlags : shippingDetailsFlags)
            if !paymentSuccessful{
                PaymentPagesButtonView(label: "Place Order", action: placeOrder)
                    .padding()
            }
        }
            
            Spacer()
        }
        .onAppear {orderItems = OrderDetailsService.orderDetailsServiceInstance.getCheckoutDataWithID()
        }
            .background(Image("backgroundTest1"))
    }
}

struct ShippingDetailsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailsUIView()
    }
}

extension ShippingDetailsUIView{
    func placeOrder(){
        setAlertText()
        if paymentFlags.cardNumberFlag && paymentFlags.securityCodeFlag && shippingDetailsFlags.zipCodeFlag && shippingDetailsFlags.addressFlag && shippingDetailsFlags.cityFlag && shippingDetailsFlags.stateFlag && shippingDetailsFlags.countryFlag{
            if CheckoutHistoryHelper.checkoutHistoryHelper.saveToOrderHistory(shippingDetails: shippingDetails, paymentDetails: paymentDetails, shippingOption: shippingSelection, monthSelection: monthSelection, yearSelection: yearSelection){
                paymentSuccessful = true
                paymentText = "Payment Successful"
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
        shippingDetailsFlags.stateFlag = shippingDetailsAlertHelper.isValidState(state: shippingDetails.state)
        shippingDetailsFlags.countryFlag = shippingDetailsAlertHelper.isValidCountry(country: shippingDetails.country)
    }
}

class ShippingHostingController: UIHostingController<ShippingDetailsUIView>{
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: ShippingDetailsUIView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
