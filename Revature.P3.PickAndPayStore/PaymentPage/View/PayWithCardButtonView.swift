//
//  PayWithCardButtonView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct PayWithCardButtonView : View{
    var body: some View{
        Button("Pay With Card"){
            print("pay with card selected")
        }
            .frame(width: 200, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}

