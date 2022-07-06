//
//  ApplePayButtonView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ApplePayButtonView : View{
    var body: some View{
        Button("Use Apple Pay"){
            print("apple pay selected")
        }
            .frame(width: 200, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(10)
    }
}
