//
//  ContentView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SignInViewModel() // Create a SignInViewModel instance
    
    var body: some View {
        if viewModel.isAuthenticated {
            DashboardNavigation()
        } else {
            SplashScreenView()
                .onAppear {
                    // Check for the access token in UserDefaults
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        let defaults = UserDefaults.standard
                        if let accessToken = defaults.value(forKey: "access_token") as? String {
                            // Access token found, set isAuthenticated to true for auto-login
                            viewModel.isAuthenticated = true
                            viewModel.fetchUsers() // Fetch user data if needed
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
