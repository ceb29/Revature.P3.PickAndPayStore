//
//  CardPaymentAlertHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import Foundation

struct CardPaymentAlertHelper{
    func isValidCardNumber(cardNumber: String) -> Bool{
        let cardNumberRegEx = "^[0-9]{16}$"
        let cardNumberPred = NSPredicate(format: "SELF MATCHES %@", cardNumberRegEx)
        return cardNumberPred.evaluate(with: cardNumber)
    }
    
    func isValidSecurityCode(securityCode: String) -> Bool{
        let securityCodeRegEx = "^[0-9]{3}$"
        let securityCodePred = NSPredicate(format: "SELF MATCHES %@", securityCodeRegEx)
        return securityCodePred.evaluate(with: securityCode)
    }
    
    func isValidZipCode(zipCode: String) -> Bool{
        let zipCodeRegEx = "^[0-9]{5}$"
        let zipCodePred = NSPredicate(format: "SELF MATCHES %@", zipCodeRegEx)
        return zipCodePred.evaluate(with: zipCode)
    }
}
