//
//  LazProjectApp.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 19/09/23.
//

import SwiftUI

@main
struct LazProjectApp: App {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
