//
//  PaymentUIView.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/3/22.
//

import SwiftUI

struct PaymentUIView: View {
    var body: some View {
        VStack{
            ShippingDetails()
            PaymentDetails()
            OrderDetails()
            PlaceOrderButton()
            Spacer()
        }
            .background(Image("backgroundTest1"))
        
    }
}

struct checkoutItem : Identifiable{
    var id = UUID()
    var name : String
    var price : Double
}

struct ShippingDetails : View{
    @State private var postcode : String = ""
    @State private var city : String = ""
    @State private var address : String = ""
    @State private var country : String = ""
    
    var body: some View{
        VStack{
            Text("Shipping Details")
                .font(.system(size: 30))
            HStack{
                Text("Zip Code")
                    .frame(width: 80)
                TextField("", text: $postcode)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 10)
            }
                .padding(5)
            
            HStack{
                Text("City")
                    .frame(width: 80)
                TextField("", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 10)
            }
                .padding(5)

            HStack{
                Text("Address")
                    .frame(width: 80)
                TextField("", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 10)
            }
                .padding(5)
            
            HStack{
                Text("Country")
                    .frame(width: 80)
                TextField("", text: $address)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 10)
            }
                .padding(5)
        }
        .padding(.bottom, 20)
    }
        
}

struct PaymentDetails : View{
    @State private var cardNumber : String = ""
    @State private var expirationMonth : String = ""
    @State private var expirationYear : String = ""
    @State private var securityCode : String = ""

    var body: some View{
        Text("Payment Details")
            .font(.system(size: 30))
        VStack{
            HStack{
                Text("Card Number")
                    .frame(width: 130)
                TextField("0000-1111-2222-3333", text: $cardNumber)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 10)
            }
                .padding(5)
            
            HStack{
                Text("Expiration Date")
                    .frame(width: 130)
                TextField("MM", text: $expirationMonth)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, height: 10)
                TextField("YY", text: $expirationYear)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, height: 10)
            }
                .padding(5)

            HStack{
                Text("Security Code")
                    .frame(width: 130)
                TextField("012", text: $securityCode)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 10)
            }
                .padding(5)
        }
        .padding(.bottom, 20)
    }
}

struct OrderDetails : View{
    @State var orderItems : [checkoutItem] = [checkoutItem(name: "Item1", price: 105.0), checkoutItem(name: "Item2", price: 24.99), checkoutItem(name: "Item3", price: 52.50), checkoutItem(name: "Item4", price: 28.20), checkoutItem(name: "Item5", price: 85.75) ]
    @State var totalCost : Float = 0
    init(){
        UITableView.appearance().contentInset.top = -25 //need to figure out a better way of removing top space from list
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View{
        
        Text("Order Details")
            .font(.system(size: 30))
        HStack{
            Text("Total Cost of Items: ")
            Text(getTotalCost())
        }
        VStack{
            List{
                Section(header: Text("List of items").foregroundColor(.black), footer: Spacer(minLength: 0)){ForEach(orderItems, id: \.id){ item in
                    HStack{
                        Text(item.name)
                        Text(String(item.price))
                    }
                }
                }
            }
            .frame(height: 215)
           
            
            //Text("Estimated Tax/Shipping Cost")
            //Text("Final Cost")
        }
        .padding(.bottom, 20)
    }
    
    func getTotalCost() -> String{
        var cost : Double = 0
        for item in orderItems{
            cost += item.price
        }
        return String(cost)
    }
}

struct PlaceOrderButton : View{
    var body: some View{
        Button("Place Order"){
            print("order placed")
        }
            .frame(width: 100, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}

struct PaymentUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentUIView()
    }
}
