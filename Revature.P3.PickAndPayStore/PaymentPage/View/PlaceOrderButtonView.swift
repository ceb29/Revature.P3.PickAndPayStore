//
//  PlaceOrderButtonView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct PlaceOrderButtonView : View{
    var body: some View{
        Button("Place Order"){
            print("order placed")
        }
            .frame(width: 100, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}
