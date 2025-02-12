//
//  Trade.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 12/02/2025.
//

import Foundation

import Foundation

enum TradeType {
    case buy
    case sell
}

struct Trade: Identifiable, Codable {
    let id = UUID()
    let ticker: String
    let quantity: Int
    let price: Double
    let tradeType: TradeType
    let date: Date
}
