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
    @State private var continueFlag : Bool = false
    @State private var successFlag : Bool = false
    @State private var paymentDetails = PaymentDetails()
    @State private var paymentFlags = PaymentFlags()
    @State private var monthSelection: MonthOption = .Jan
    @State private var yearSelection: YearOption = .option1
    @State private var paymentSuccessful: Bool = false
    @State private var paymentText = ""
    var orderItems : [CheckoutItem] = OrderDetailsService.orderDetailsServiceInstance.getCheckoutDataWithID()
    
    var body: some View {
        /*
        NavigationView{
        VStack{
            Text("Shipping Details")
               .font(.system(size: 30))
               .bold()
            VStack{
                ShippingDetailsView(shippingDetails: $shippingDetails)
                ShippingOptionsPickerView(shippingSelection: $shippingSelection)
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            Spacer()
            ShippingDetailsAlertView(continueFlag: continueFlag, shippingDetailsFlags: shippingDetailsFlags)
            PaymentPagesButtonView(label: "Save", action: continueToNextPage)
            if successFlag{
                NavigationLink(destination: CheckoutPageUIView()){
                    Text("Continue")
                }
                .frame(width: 200, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
            }
            Spacer()
            
        }
            .background(Image("backgroundTest1"))
        }*/
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
                ShippingOptionsPickerView(shippingSelection: $shippingSelection)
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            OrderDetailsView(checkoutItems: orderItems)
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
        if paymentFlags.cardNumberFlag && paymentFlags.securityCodeFlag && shippingDetailsFlags.zipCodeFlag && shippingDetailsFlags.addressFlag && shippingDetailsFlags.cityFlag{
            if CheckoutHistoryHelper.checkoutHistoryHelper.saveToOrderHistory(){
                paymentSuccessful = true
                paymentText = "Payment Successful"
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
    /*
    func continueToNextPage(){
        setAlertText()
        if shippingDetailsFlags.zipCodeFlag && shippingDetailsFlags.addressFlag && shippingDetailsFlags.cityFlag{
            successFlag = true
            print("continue to next page")
        }
    }
    
    func setAlertText(){
        let shippingDetailsAlertHelper = ShippingDetailsAlertHelper()
        continueFlag = true
        shippingDetailsFlags.zipCodeFlag = shippingDetailsAlertHelper.isValidZipCode(zipCode: shippingDetails.zipCode)
        shippingDetailsFlags.addressFlag = shippingDetailsAlertHelper.isValidAddress(address: shippingDetails.address)
        shippingDetailsFlags.cityFlag = shippingDetailsAlertHelper.isValidCity(city: shippingDetails.city)
    }
     */
}

class ShippingHostingController: UIHostingController<ShippingDetailsUIView>{
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: ShippingDetailsUIView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
