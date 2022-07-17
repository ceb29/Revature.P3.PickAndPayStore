//
//  CardPaymentAlertHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import Foundation

class CardPaymentAlertHelper{
    static var helper = CardPaymentAlertHelper()
    
    func isValidPayment(paymentDetails: PaymentDetails) -> PaymentFlags{
        var paymentFlags = PaymentFlags()
        paymentFlags.placeOrderFlag = true
        paymentFlags.cardNumberFlag = isValidCardNumber(cardNumber: paymentDetails.cardNumber)
        paymentFlags.securityCodeFlag = isValidSecurityCode(securityCode: paymentDetails.securityCode)
        return paymentFlags
    }
    
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
}
