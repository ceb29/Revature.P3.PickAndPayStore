//
//  PaymentAlertView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import SwiftUI

struct PaymentAlertView : View{
    var paymentFlags : PaymentFlags
    var shippingFlags : ShippingFlags
    
    var body: some View{
        if paymentFlags.placeOrderFlag{
            if !paymentFlags.cardNumberFlag{
                Text("Card Number must be 16 digits")
            }
            else if !paymentFlags.securityCodeFlag{
                Text("Security Code must be 3 digits")
            }
            else if !shippingFlags.zipCodeFlag{
                Text("Zip Code must be 5 digits")
            }
        }
    }
}


