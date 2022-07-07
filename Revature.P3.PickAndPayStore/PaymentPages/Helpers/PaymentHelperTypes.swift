//
//  PaymentHelperTypes.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import Foundation

enum ShippingOption: String, CaseIterable, Identifiable {
    case standard, priority, express
    var id: Self { self }
}
