//
//  HistoryView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/5/22.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack{
            HistoryDetailsSwiftUIView()
        }
        .background(Image("backgroundTest1"))
    }
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
