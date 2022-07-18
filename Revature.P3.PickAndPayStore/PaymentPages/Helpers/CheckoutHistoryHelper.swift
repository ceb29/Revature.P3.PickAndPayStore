//
//  CheckoutHistoryHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/12/22.
//

import Foundation

class CheckoutHistoryHelper{
    static var helper = CheckoutHistoryHelper()
    var checkoutItems : [CartItemViewModel] = OrderDetailsService.orderDetailsServiceInstance.getCheckoutData()
    
    private init(){
        
    }
    
    func updateCheckoutItems(){
        checkoutItems = OrderDetailsService.orderDetailsServiceInstance.getCheckoutData()
    }
    
    func getShippingText(shippingSelection: ShippingOption) -> String{
        updateCheckoutItems()
        var text : String
        if isShippingFree(){
            text = "Free"
        }
        else{
            text = "$" + String(getShippingCost(shippingSelection: shippingSelection))
        }
        return text
    }
    
    func isShippingFree() -> Bool{
        if getTotalCost() > 200{
            return true
        }
        else{
            return false
        }
    }
    
    func getTotalCost() -> Float{
        var cost : Float = 0
        for item in checkoutItems{
            cost += Float(item.price) ?? 0
        }
        return cost
    }
    
    func getTotalCostWithShipping(shippingSelection: ShippingOption) -> Float{
        var cost = getTotalCost()
        cost += getShippingCost(shippingSelection: shippingSelection)
        return cost
    }
    
    func getTaxCost(shippingSelection: ShippingOption) -> Float{
        let totalCost = getTotalCostWithShipping(shippingSelection: shippingSelection)
        return totalCost * 0.07
    }
    
    func getFinalCost(shippingSelection: ShippingOption) -> Float{
        var cost = getTotalCostWithShipping(shippingSelection: shippingSelection)
        cost += getTaxCost(shippingSelection: shippingSelection)
        return cost
    }
    
    func getShippingCost(shippingSelection: ShippingOption) -> Float{
        switch shippingSelection{
            case .standard:
            if isShippingFree(){
                return 0
            }
            else{
                return 4.99
            }
                
            case .priority:
                return 9.99
            case .express:
                return 14.99
        }
    }
    
    func areTextFieldsCorrect(paymentFlags: PaymentFlags, shippingDetailsFlags: ShippingDetailsFlags) -> Bool{
        if paymentFlags.cardNumberFlag && paymentFlags.securityCodeFlag && shippingDetailsFlags.zipCodeFlag && shippingDetailsFlags.addressFlag && shippingDetailsFlags.cityFlag && shippingDetailsFlags.stateFlag && shippingDetailsFlags.countryFlag{
            return true
        }
        return false
    }
    
    func getShippingOptionString(shippingOption: ShippingOption) -> String{
        switch shippingOption {
        case .standard:
            return "standard"
        case .priority:
            return "priority"
        case .express:
            return "express"
        }
    }
    
    func getAddressString(shippingDetails: ShippingDetails) -> String{
        let address = shippingDetails.zipCode + " " + shippingDetails.address + " "  + shippingDetails.city + " " + shippingDetails.state + " " + shippingDetails.country
        return address
    }
    
    func getCardString(paymentDetails: PaymentDetails, monthOption: MonthOption, yearOption: YearOption) -> String{
        let card = paymentDetails.cardNumber + " " + monthOption.rawValue + " " + yearOption.rawValue + " " + paymentDetails.securityCode
        return card
    }
    
    func saveToOrderHistory(shippingDetails: ShippingDetails, paymentDetails: PaymentDetails, shippingOption: ShippingOption, monthSelection: MonthOption, yearSelection: YearOption) -> Bool{
        if CurrentUser.currentUser.name != nil{
            let user = CurrentUser.currentUser.name!
            let date = Date.now
            let address = getAddressString(shippingDetails: shippingDetails)
            let card = getCardString(paymentDetails: paymentDetails, monthOption: monthSelection, yearOption: yearSelection)
            let shipOption = getShippingOptionString(shippingOption: shippingOption)
            for checkoutItem in checkoutItems{
                DBHelperUser.dbHelperUser.addItemHistory(username: user, productID: checkoutItem.productID, date: date, address: address, card: card, shippingOption: shipOption)
            }
            clearCart()
            return true
        }
        return false
    }
    
    func clearCart(){
        for cartItem in checkoutItems{
            DBHelperUser.dbHelperUser.deleteCartItem(username: CurrentUser.currentUser.name!, productID: cartItem.productID)
        }
    }
}


