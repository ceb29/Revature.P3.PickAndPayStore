//
//  ShippingDetailsAlertHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import Foundation

class ShippingDetailsAlertHelper{
    static var helper = ShippingDetailsAlertHelper()
    
    private init(){
        
    }
    
    func isValidShipping(shippingDetails: ShippingDetails) -> ShippingDetailsFlags{
        var shippingDetailsFlags = ShippingDetailsFlags()
        shippingDetailsFlags.zipCodeFlag = isValidZipCode(zipCode: shippingDetails.zipCode)
        shippingDetailsFlags.addressFlag = isValidAddress(address: shippingDetails.address)
        shippingDetailsFlags.cityFlag = isValidCity(city: shippingDetails.city)
        shippingDetailsFlags.stateFlag = isValidState(state: shippingDetails.state)
        shippingDetailsFlags.countryFlag = isValidCountry(country: shippingDetails.country)
        return shippingDetailsFlags
    }
    
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
    
    func isValidState(state: String) -> Bool{
        let stateRegEx = "^[A-Za-z ]{1,}$"
        let statePred = NSPredicate(format: "SELF MATCHES %@", stateRegEx)
        return statePred.evaluate(with: state)
    }
    
    func isValidCountry(country: String) -> Bool{
        let countryRegEx = "^[A-Za-z ]{1,}$"
        let countryPred = NSPredicate(format: "SELF MATCHES %@", countryRegEx)
        return countryPred.evaluate(with: country)
    }
}
