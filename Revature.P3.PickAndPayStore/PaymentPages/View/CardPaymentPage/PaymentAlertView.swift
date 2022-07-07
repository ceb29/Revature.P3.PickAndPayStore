//
//  PaymentAlertView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import SwiftUI

struct PaymentAlertView : View{
    var placeOrderFlag : Bool
    var cardNumberFlag : Bool
    var securityCodeFlag : Bool
    var zipCodeFlag : Bool
    
    var body: some View{
        if placeOrderFlag{
            if !cardNumberFlag{
                Text("Card Number must be 16 digits")
            }
            else if !securityCodeFlag{
                Text("Security Code must be 3 digits")
            }
            else if !zipCodeFlag{
                Text("Zip Code must be 5 digits")
            }
        }
    }
}


