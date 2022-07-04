//
//  GoToOrderDetailsButtonView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct GoToOrderDetailsButtonView : View{
    var body: some View{
        Button("Continue"){
            print("go to order details selected")
        }
            .frame(width: 200, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}
