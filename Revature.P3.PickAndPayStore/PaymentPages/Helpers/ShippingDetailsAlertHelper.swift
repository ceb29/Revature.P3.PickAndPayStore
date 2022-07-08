//
//  ShippingDetailsAlertHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import Foundation

struct ShippingDetailsAlertHelper{
    func isValidZipCode(zipCode: String) -> Bool{
        let zipCodeRegEx = "^[0-9]{5}$"
        let zipCodePred = NSPredicate(format: "SELF MATCHES %@", zipCodeRegEx)
        return zipCodePred.evaluate(with: zipCode)
    }
    
    func isValidAddress(address: String) -> Bool{
        let addressRegEx = "^[0-9A-Za-z .'#@%&/-]{1,}$"
        let addressPred = NSPredicate(format: "SELF MATCHES %@", addressRegEx)
        return addressPred.evaluate(with: address)
    }
    
    func isValidCity(city: String) -> Bool{
        let cityRegEx = "^[A-Za-z .'-]{1,}$"
        let cityPred = NSPredicate(format: "SELF MATCHES %@", cityRegEx)
        return cityPred.evaluate(with: city)
    }
    
    /*
    func isValidState(state: String) -> Bool{
        let stateRegEx = "^[A-Za-z ]$"
        let statePred = NSPredicate(format: "SELF MATCHES %@", stateRegEx)
        return statePred.evaluate(with: state)
    }
    
    func isValidCountry(country: String) -> Bool{
        let countryRegEx = "^[A-Za-z ]$"
        let countryPred = NSPredicate(format: "SELF MATCHES %@", countryRegEx)
        return countryPred.evaluate(with: country)
    }
    */
}
