//
//  DashboardNavigation.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 25/09/23.
//

import SwiftUI

struct DashboardNavigation: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var signinVM = SignInViewModel()
    
    @State private var search = ""
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
                    ZStack {
                        Color("bgColor")
                            .ignoresSafeArea()
                        
                        VStack {
                            
                            Spacer()
                            
                            TabView(selection: $selectedTab) {
                                HomeView()
                                
                                    .tabItem {
                                        Label("Home", systemImage: "house")
                                    }
                                    .tag(0)
                                
                                
                                Text("Wishlist Tab")
                                    .tabItem {
                                        Label("Wishlist", systemImage: "heart")
                                    }
                                    .tag(1)
                                
                                
                                CartView()
                                    .tabItem {
                                        Label("Order", systemImage: "cart")
                                    }
                                    .tag(2)
                                
                                Text("My Card Tab")
                                    .tabItem {
                                        Label("My Cards", systemImage: "creditcard")
                                    }
                                    .tag(3)
                            }
                            .accentColor(Color("btnPrimary"))
                            
                            
                            Spacer()
                        }
                        .ignoresSafeArea(.all)
                        
                    }
                }
                .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DashboardNavigation()
}
