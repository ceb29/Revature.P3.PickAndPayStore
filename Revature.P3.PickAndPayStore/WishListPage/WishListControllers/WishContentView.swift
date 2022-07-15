//
//  WishContentView.swift
//  WishList
//
//  Created by Mihir Ghosh on 7/1/22.
//

import SwiftUI
import CoreData
struct WishContentView: View {
    
    var wishObj = [WishlistItem]()
    //wishObj = DBHelperWishlist.dbHelper.getWishlistData()
    @State var wishItems: [String] = [
        "This is item one",
        "This is item two",
        "This is item three",
        "This is item four",
        "This is item five"
    ]
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    Section(header: Text("List of items")){
                        ForEach(wishItems, id: \.self){items in
                            HStack{
                                Image(systemName: "star")
                                Text(items)
                                
                            }
                        }
                        .onDelete(perform: deleteData)
                        .onMove(perform: {fset, nset in
                            wishItems.move(fromOffsets: fset, toOffset: nset)
                        })
                    }
                }.navigationTitle("User's wish list")
                .navigationBarItems(trailing: EditButton())
            }
            .background(
                Image("backgroundTest1")
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
            )
        }
    }
    func deleteData(index : IndexSet){
        //DBHelperWishlist.dbHelper.deleteWishlestData(productID: index)
        wishItems.remove(atOffsets: index)
    }
}

struct WishContentView_Previews: PreviewProvider {
    static var previews: some View {
        WishContentView()
    }
}
