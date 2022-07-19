//
//  WishContentView.swift
//  WishList
//
//  Created by Admin on 7/18/22.
//

import SwiftUI
import CoreData
struct WishContentView: View {
    @State private var wishObj = WishListService.wishService.getData()
    @State private var selection : UUID?
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        //UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("List of items")){
                        ForEach(wishObj, id: \.id){items in
                            wishlistTableItem(name: items.name, productID: items.prodId, id: items.id, selection: $selection)
                        }
                        .onDelete(perform: deleteData)
                        .onMove(perform: {fset, nset in
                            wishObj.move(fromOffsets: fset, toOffset: nset)
                        })
                    }
                }.navigationTitle("User's wish list")
                .navigationBarItems(trailing: EditButton())
            }
            .onAppear {wishObj = WishListService.wishService.getData()}
            .background(
                Image("backgroundTest1")
            )
        }
    }
    func deleteData(index : IndexSet){
        DBHelperUser.dbHelperUser.deleteWishlist(username: CurrentUser.currentUser.name!, productID: wishObj[index.first!].prodId)
        wishObj.remove(atOffsets: index)
    }
}

struct WishContentView_Previews: PreviewProvider {
    static var previews: some View {
        WishContentView()
    }
}

struct wishlistTableItem: View{
    var name : String
    var productID : String
    var id : UUID?
    @Binding var selection : UUID?
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName: "star")
                Text(name)
                Spacer()
            }
            HStack{
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
