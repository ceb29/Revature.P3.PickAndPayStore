//
//  PaymentPagesButtonView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import SwiftUI

struct PaymentPagesButtonView : View{
    var label : String
    var action : () -> Void
    var body: some View{
        Button(label, action: action)
            .frame(width: 200, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}
