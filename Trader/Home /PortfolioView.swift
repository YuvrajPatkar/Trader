//
//  PortfolioView.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 12/02/2025.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var portfolio: Portfolio
    @State private var showTradeView = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Portfolio Value: $\(portfolio.cashBalance, specifier: "%.2f")")
                    .font(.title)
                    .padding()

                List {
                    ForEach(portfolio.holdings.keys.sorted(), id: \.self) { ticker in
                        if let holding = portfolio.holdings[ticker] {
                            VStack(alignment: .leading) {
                                Text("\(ticker)")
                                    .font(.headline)
                                Text("Quantity: \(holding.quantity)")
                                Text("Avg Price: $\(holding.avgPrice, specifier: "%.2f")")
                            }
                        }
                    }
                }

                Button(action: { showTradeView.toggle() }) {
                    Text("Make a Trade")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showTradeView) {
                    TradeView().environmentObject(portfolio)
                }
            }
            .navigationTitle("Portfolio")
        }
    }
}

#Preview {
    PortfolioView()
}
