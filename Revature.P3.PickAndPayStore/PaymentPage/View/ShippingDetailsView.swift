//
//  ShippingDetailsView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/4/22.
//

import SwiftUI

struct ShippingDetailsView : View{
    @State private var postcode : String = ""
    @State private var city : String = ""
    @State private var address : String = ""
    @State private var country : String = ""
    
    var body: some View{
        
        VStack{
            //Text("Shipping Details")
            //   .font(.system(size: 30))
            //    .bold()
            HStack{
                Text("Zip Code")
                    .frame(width: 80)
                TextField("", text: $postcode)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 300, height: 10)
            }
                .padding(.trailing, 5)
            
            HStack{
                Text("Address")
                    .frame(width: 80)
                TextField("", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 300, height: 10)
            }
                .padding(.trailing, 5)
            
            HStack{
                Text("City")
                    .frame(width: 80)
                TextField("", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 300, height: 10)
            }
                .padding(.trailing, 5)

            HStack{
                Text("State")
                    .frame(width: 80)
                TextField("", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 300, height: 10)
            }
                .padding(.trailing, 5)
            
            HStack{
                Text("Country")
                    .frame(width: 80)
                TextField("", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    //.frame(width: 300, height: 10)
            }
                .padding(.trailing, 5)
        }
        .padding()
    }
}
