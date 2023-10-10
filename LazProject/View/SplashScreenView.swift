//
//  SplashScreenView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 26/09/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            OnBoardingView()
        } else {
            ZStack {
                Color("bgColorSplash")
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 60, height: 40)
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
