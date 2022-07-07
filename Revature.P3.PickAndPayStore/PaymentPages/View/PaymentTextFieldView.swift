//
//  PaymentTextFieldView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/6/22.
//

import SwiftUI

struct PaymentTextFieldView : View{
    var label : String
    var labelWidth : CGFloat
    var placeholder : String
    @Binding var content : String
    
    var body: some View{
        HStack{
            Text(label)
                .frame(width: labelWidth)
            TextField(placeholder, text: $content)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
        }
            .padding(.trailing, 5)
    }
}


