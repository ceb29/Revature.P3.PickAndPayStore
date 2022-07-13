//
//  CheckoutHistoryHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/12/22.
//

import Foundation

class CheckoutHistoryHelper{
    static var checkoutHistoryHelper = CheckoutHistoryHelper()
    var checkoutItems : [CartItemViewModel] = OrderDetailsService.orderDetailsServiceInstance.getCheckoutData()
    
    func saveToOrderHistory(){
        if CurrentUser.currentUser.name != nil{
            let user = CurrentUser.currentUser.name!
            for checkoutItem in checkoutItems{
                DBHelperUser.dbHelperUser.addItemHistory(username: user, productID: checkoutItem.productID, date: Date.now)
            }
        }
    }
}


