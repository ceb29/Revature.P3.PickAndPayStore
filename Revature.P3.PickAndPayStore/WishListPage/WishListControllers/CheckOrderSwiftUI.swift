//
//  CheckOrderSwiftUI.swift
//  WishList
//
//  Created by Mihir Ghosh on 7/7/22.
//

import SwiftUI

struct CheckOrderSwiftUI: View {
    var orders = ["Order 1", "Order 2", "Order 3", "Order 4", "Order 5"]
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    Section(header: Text("Ordered items")){
                        ForEach(orders, id: \.self){items in
                            HStack{
                                Image(systemName: "citcle.check")
                                Text(items)
                                
                            }
                        }
                    }
                }
                .navigationTitle("Check order list")
                .navigationBarItems(trailing: EditButton())
            }
            .background(
                Image("backgroundTest1"))
          
        }
        
        
    }
}

struct CheckOrderSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CheckOrderSwiftUI()
    }
}
