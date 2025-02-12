//
//  Stock.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 12/02/2025.
//

import Foundation

struct Stock: Identifiable {
    let id = UUID()
    let ticker: String
    let name: String
    let price: Double
    var quantityOwned: Int // Track how much the user owns
}
