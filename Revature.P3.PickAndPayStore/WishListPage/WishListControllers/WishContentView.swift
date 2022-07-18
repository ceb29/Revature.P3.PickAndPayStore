//
//  WishContentView.swift
//  WishList
//
//  Created by Mihir Ghosh on 7/1/22.
//

import SwiftUI
import CoreData
struct WishContentView: View {
    @State private var wishObj = WishListService.wishService.getData()
   
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
                            HStack{
                                Image(systemName: "star")
                                Text(items.name)
                                
                            }
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
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
            )
        }
    }
    func deleteData(index : IndexSet){
        //DBHelperWishlist.dbHelper.deleteWishlestData(productID: wishObj[index.first!].prodId)
        DBHelperUser.dbHelperUser.deleteWishlist(username: CurrentUser.currentUser.name!, productID: wishObj[index.first!].prodId)
        wishObj.remove(atOffsets: index)
    }
}

struct WishContentView_Previews: PreviewProvider {
    static var previews: some View {
        WishContentView()
    }
}
