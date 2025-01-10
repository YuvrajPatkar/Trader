//
//  Home Screen.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 10/01/2025.
//

import SwiftUI

struct Home_Screen: View {

    @State var showingNewOrderPage = false
    @State var StockEntered: String = ""
    @State var QuantityBought: String = ""
    @State var OrderType:Bool = true
    
    
    
    var body: some View {
        VStack{
            Spacer()
            Section {
                Text("Total Portfolio Value")
                    .font(.system(size: 30, weight: .medium ))
                    
                Text(String("text"))
                    .font(.system(size:25, weight: .bold))
                    .foregroundColor(Color.green)
                Spacer()
                Button("New Order") {
                    showingNewOrderPage.toggle()
                }
                
                
                .sheet(isPresented: $showingNewOrderPage) {

                    Section {
                        Form{
                            TextField("Enter Stock Name", text: $StockEntered)
                            TextField("Enter Quantity", text:
                                        $QuantityBought)
                            
                            Toggle(isOn: $OrderType, label: {
                                if OrderType == true {
                                    Text("Buy")
                                
                                } else {
                                    Text("Sell")
                                    
                                }
                            })
              
                        }
                    }
                    Button("Confirm Order") {
                        showingNewOrderPage.toggle()
                        hapticSuccessFeedback()
                    }.sensoryFeedback(.success, trigger: showingNewOrderPage)
                 
                }
            }
        }
    }
    public func hapticSuccessFeedback() {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }

    
    
    
    
}

#Preview {
    Home_Screen()
}
