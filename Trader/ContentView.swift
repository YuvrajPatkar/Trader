//
//  ContentView.swift
//  Trader
//
//  Created by Yuvraj Rahul Patkar on 10/01/2025.
//

import SwiftUI

struct ContentView: View {
   
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            TabView {
                Home_Screen()
                    .tabItem {
                        Label("Home", systemImage: "macpro.gen2")
                    }
                
                Exchange_Screen()
                    .tabItem {
                        Label("Exchange", systemImage: "ferry.fill")
                    }
                History_Screen()
                    .tabItem {
                        Label("History", systemImage: "ivfluid.bag")
                    }
            }
        }
        .onAppear{
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Welcome To NeoTrader"),
                  message: Text("Disclaimer: This is a mock trading app. There is no use of real money all positions are on paper."),
                  dismissButton: .default(Text("I Understand"))
            )
        }
        
    }
}
    
    

#Preview {
    ContentView()
}
