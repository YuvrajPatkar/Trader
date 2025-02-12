//
//  TradeView.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 12/02/2025.
//

import SwiftUI

struct TradeView: View {
    @EnvironmentObject var portfolio: Portfolio
    @State private var ticker: String = ""
    @State private var quantity: String = ""
    @State private var price: String = ""
    @State private var isBuying: Bool = true
    
    var body: some View {
        VStack {
            Text(isBuying ? "Buy Stock" : "Sell Stock")
                .font(.largeTitle)
                .padding()

            TextField("Stock Ticker (e.g. AAPL)", text: $ticker)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Quantity", text: $quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            TextField("Price", text: $price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            HStack {
                Button(action: { isBuying.toggle() }) {
                    Text(isBuying ? "Switch to Sell" : "Switch to Buy")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()

            Button(action: executeTrade) {
                Text(isBuying ? "Buy" : "Sell")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isBuying ? Color.green : Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
    
    private func executeTrade() {
        guard let tradeQuantity = Int(quantity), let tradePrice = Double(price), !ticker.isEmpty else {
            print("Invalid input")
            return
        }
        
        let tradeType: TradeType = isBuying ? .buy : .sell
        portfolio.executeTrade(ticker: ticker.uppercased(), quantity: tradeQuantity, price: tradePrice, tradeType: tradeType)
    }
}

#Preview {
    TradeView()
}
