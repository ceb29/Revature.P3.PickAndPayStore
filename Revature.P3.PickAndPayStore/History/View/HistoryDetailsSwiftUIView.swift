//
//  HistoryDetailsSwiftUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/5/22.
//

import SwiftUI

struct HistoryDetailsSwiftUIView: View {
    
    @State var historyItems : [HistoryItemViewModel] = HistoryService.historyService.getHist()
    var body: some View {
        Text("Order History")
            .font(.system(size: 30))
            .bold()
        VStack{
            List{
                Section(header: Text("Previously Ordered Items").foregroundColor(.black), footer : Spacer(minLength: 0)){
                    ForEach(historyItems, id: \.productID){ item in
                        HStack{
//                            Image(item.imageData)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                            Data(item.imageData!)
                            Text(item.name)
                            Text(item.date, style : .date)
                            
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
