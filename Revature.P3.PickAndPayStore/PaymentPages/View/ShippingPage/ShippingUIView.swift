//
//  ShippingDetailsUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingDetailsUIView: View {
    @State private var shippingDetails = ShippingDetails()
    @State private var shippingSelection : ShippingOption = .standard
    @State private var shippingDetailsFlags = ShippingDetailsFlags()
    @State private var continueFlag : Bool = false
    
    var body: some View {
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
            PaymentPagesButtonView(label: "Continue", action: continueToNextPage)
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
    func continueToNextPage(){
        setAlertText()
        if shippingDetailsFlags.zipCodeFlag && shippingDetailsFlags.addressFlag && shippingDetailsFlags.cityFlag{
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
}

