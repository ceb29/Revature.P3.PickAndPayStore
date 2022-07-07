//
//  ShippingDetailsUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingDetailsUIView: View {
    @State private var zipCode : String = ""
    @State private var city : String = ""
    @State private var address : String = ""
    @State private var state : String = ""
    @State private var country : String = ""
    @State private var shippingSelection: ShippingOption = .standard
    @State private var zipCodeFlag : Bool = false
    @State private var continueFlag : Bool = false
    
    var body: some View {
        VStack{
            Text("Shipping Details")
               .font(.system(size: 30))
               .bold()
            VStack{
                ShippingDetailsView(zipCode: $zipCode, city: $city, address: $address, state: $state, country: $country)
            }
                .background(.white)
                .cornerRadius(15)
                .padding()
            //ShippingOptionsView()
            ShippingOptionsPickerView(shippingSelection: $shippingSelection)
            Spacer()
            ShippingDetailsAlertView(continueFlag: continueFlag, zipCodeFlag: zipCodeFlag)
            PaymentPagesButtonView(label: "Continue", action: setAlertText)
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
    func setAlertText(){
        let shippingDetailsAlertHelper = ShippingDetailsAlertHelper()
        continueFlag = true
        zipCodeFlag = shippingDetailsAlertHelper.isValidZipCode(zipCode: zipCode)
    }
}

