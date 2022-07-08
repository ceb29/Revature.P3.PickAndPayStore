//
//  HistoryDetailsSwiftUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/5/22.
//

import SwiftUI

struct HistoryDetailsSwiftUIView: View {
    @State var historyItems : [historyItem] = [historyItem(image: "basketball", name: "basketball", date : "01-01-2022"), historyItem(image: "games", name: "games", date : "01-01-2022"), historyItem(image: "doritos", name: "Doritos", date : "01-01-2022"), historyItem(image: "ipad4", name: "Ipad 4", date : "01-01-2022"),]
    var body: some View {
        Text("Order History")
            .font(.system(size: 30))
            .bold()
        VStack{
            List{
                Section(header: Text("Previously Ordered Items").foregroundColor(.black), footer : Spacer(minLength: 0)){
                    ForEach(historyItems, id: \.id){ item in
                        HStack{
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(item.name)
                            Text(item.date)
                            
                        }
                    }
                }
            }
        
            .padding(.bottom, 5)
            
        }
    }
}

struct HistoryDetailsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailsSwiftUIView()
    }
}

struct historyItem : Identifiable{
    var id = UUID()
    var image : String
    var name : String
    var date : String
    
}
