//
//  ShippingDetailsUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import UIKit
import SwiftUI

struct PaymentPageSwiftUIView: View {
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
                ShippingOptionsPickerView(shippingSelection: $shippingSelection, standardShippingText: CheckoutHistoryHelper.helper.getShippingText(shippingSelection: shippingSelection))
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            OrderDetailsView(orderItems: orderItems, shippingcost: CheckoutHistoryHelper.helper.getShippingCost(shippingSelection: shippingSelection), taxCost: CheckoutHistoryHelper.helper.getTaxCost(shippingSelection: shippingSelection), totalCost: CheckoutHistoryHelper.helper.getFinalCost(shippingSelection: shippingSelection))
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

struct PaymentPageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentPageSwiftUIView()
    }
}

extension PaymentPageSwiftUIView{
    func placeOrder(){
        setAlertText()
        if CheckoutHistoryHelper.helper.areTextFieldsCorrect(paymentFlags: paymentFlags, shippingDetailsFlags: shippingDetailsFlags){
            if CheckoutHistoryHelper.helper.saveToOrderHistory(shippingDetails: shippingDetails, paymentDetails: paymentDetails, shippingOption: shippingSelection, monthSelection: monthSelection, yearSelection: yearSelection){
                paymentSuccessful = true
                paymentText = "Payment Successful"
            }
        }
    }
    
    func setAlertText(){
        paymentFlags = CardPaymentAlertHelper.helper.isValidPayment(paymentDetails: paymentDetails)
        shippingDetailsFlags = ShippingDetailsAlertHelper.helper.isValidShipping(shippingDetails: shippingDetails)
    }
}

class ShippingHostingController: UIHostingController<PaymentPageSwiftUIView>{
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: PaymentPageSwiftUIView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
