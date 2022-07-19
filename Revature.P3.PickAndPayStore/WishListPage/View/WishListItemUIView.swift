//
//  WishListItemUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/19/22.
//

import SwiftUI

struct WishlistItemUIView: View{
    var name : String
    var productID : String
    var price : String
    var id : UUID?
    @Binding var selection : UUID?
    
    var body: some View{
        VStack{
            HStack{
                Text(name)
                Spacer()
            }
            HStack{
                Text(price)
                Spacer()
                if selection == id{
                    Image(systemName: "checkmark")
                }
                Button(action: {
                    DBHelperUser.dbHelperUser.addCartItem(username: CurrentUser.currentUser.name!, productID: productID)
                    selection = id
                }){
                        Text("add to cart")
                }
                    .frame(width: 100, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
    }
}
