//
//  Expanded Stock Sheet View.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 10/01/2025.
//

import SwiftUI

struct Expanded_Stock_Sheet_View: View {
    var stock: StockFinancialData
    
    var body: some View {
        VStack{
            Text(stock.name)
                .font(.system(size: 40, weight: .bold))
            Text("Current Price: \(stock.price)")
                .font(.system(size: 20))
            Text("Percentge Change:  \(stock.changesPercentage)")
            Text("Points Change: \(stock.change)")
            Text("Market Cap: \(stock.marketCap)")
            Text("Volume: \(stock.volume)")
            
            
            
        }
    }
    
    
}
