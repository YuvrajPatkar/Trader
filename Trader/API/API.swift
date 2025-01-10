//
//  API.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 10/01/2025.
//

import Foundation

class FinancialDataAPI: ObservableObject {
    static let shared = FinancialDataAPI()
    @Published var stockFinancialData: StockFinancialData?
    
    func getFinancialData(symbol: String, completion: @escaping (Bool) -> Void) {
        let apiToken = "rkdDDmqRlNNOqyo9Qh4JQJgQkkX9s2qc"
        let baseUrl = "https://financialmodelingprep.com/api/v3/quote/"
        
        guard var urlComponents = URLComponents(string: baseUrl) else {
            completion(false)
            return
        }
        
        urlComponents.path += symbol
        urlComponents.queryItems = [URLQueryItem(name: "apikey", value: apiToken)]
        
        guard let url = urlComponents.url else {
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code.")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                        print("Raw JSON response: \(jsonString)")
                    }
                do {
                    let response = try JSONDecoder().decode([StockFinancialData].self, from: data)
                    DispatchQueue.main.async {
                        self.stockFinancialData = response.first
                        completion(true)
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
            }
        }.resume()
    }
}

