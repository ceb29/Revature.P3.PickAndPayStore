//
//  WishContentView.swift
//  WishList
//
//  Created by Admin on 7/18/22.
//

import SwiftUI
import CoreData
struct WishListSwiftUIView: View {
    @State private var wishObj = WishListService.wishService.getData()
    @State private var selection : UUID?
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("List of items")){
                        ForEach(wishObj, id: \.id){items in
                            WishlistItemUIView(name: items.name, productID: items.prodId, id: items.id, selection: $selection)
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

struct WishListSwiftUIView_Prevews: PreviewProvider {
    static var previews: some View {
        WishListSwiftUIView()
    }
}


