//
//  ShippingDetailsAlertHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import SwiftUI

struct ShippingDetailsAlertHelper{
    func isValidZipCode(zipCode: String) -> Bool{
        let zipCodeRegEx = "^[0-9]{5}$"
        let zipCodePred = NSPredicate(format: "SELF MATCHES %@", zipCodeRegEx)
        return zipCodePred.evaluate(with: zipCode)
    }
}
