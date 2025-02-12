//
//  Portfolio.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 12/02/2025.
//

import Foundation

class Portfolio: ObservableObject {
    @Published var holdings: [String: (quantity: Int, avgPrice: Double)] = [:] // Ticker -> (quantity, avgPrice)

    func executeTrade(ticker: String, quantity: Int, price: Double, tradeType: TradeType) {
        let totalCost = Double(quantity) * price

        switch tradeType {
        case .buy:
            if let existing = holdings[ticker] {
                let newQuantity = existing.quantity + quantity
                let newAvgPrice = ((existing.avgPrice * Double(existing.quantity)) + totalCost) / Double(newQuantity)
                holdings[ticker] = (newQuantity, newAvgPrice)
            } else {
                holdings[ticker] = (quantity, price)
            }

        case .sell:
            if let existing = holdings[ticker], existing.quantity >= quantity {
                let newQuantity = existing.quantity - quantity
                if newQuantity == 0 {
                    holdings.removeValue(forKey: ticker)
                } else {
                    holdings[ticker] = (newQuantity, existing.avgPrice)
                }
            }
        }
    }

    func getStockQuantity(ticker: String) -> Int {
        return holdings[ticker]?.quantity ?? 0
    }
}
