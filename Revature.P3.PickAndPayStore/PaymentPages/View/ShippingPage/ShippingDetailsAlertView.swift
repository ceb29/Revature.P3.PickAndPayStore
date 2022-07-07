//
//  ShippingDetailsAlertView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import SwiftUI

struct ShippingDetailsAlertView : View{
    var continueFlag : Bool
    var zipCodeFlag : Bool

    var body: some View{
        if continueFlag && !zipCodeFlag{
            Text("Zipcode must be 5 digits")
        }
    }
}
