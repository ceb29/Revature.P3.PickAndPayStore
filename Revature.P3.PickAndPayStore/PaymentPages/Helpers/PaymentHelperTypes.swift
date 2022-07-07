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

enum MonthOption: String, CaseIterable, Identifiable {
    case Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    var id: Self { self }
}

enum YearOption: String, CaseIterable, Identifiable {
    case option1 = "2022"
    case option2 = "2023"
    case option3 = "2024"
    case option4 = "2025"
    case option5 = "2026"
    case option6 = "2027"
    case option7 = "2028"
    var id: Self { self }
}
