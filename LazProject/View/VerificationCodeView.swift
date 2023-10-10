//
//  VerificationCodeView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 21/09/23.
//

import SwiftUI

struct VerificationCodeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var otp = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Forgot Password")
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.bottom)
                    
                    Image("forgot")
                        .resizable()
                        .frame(width: 225, height: 166)
                        .padding()
                    
                    
                    
                    OTPTextField(otp: $otp)
                    
                    Spacer()
                    
                    HStack {
                        Text("00:20")
                            .font(.system(size: 16, weight: .bold))
                        
                        Text("resend confirmation code.")
                            .font(.system(size: 13))
                    }
                    .padding()
                    
                    Button(action: {
                        print("\(otp)")
                    }) {
                        Text("Confirm Mail")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Circle()
                                .foregroundColor(Color("bgButtonBack"))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(Color.primary)
                                )
                                .padding(.top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    VerificationCodeView()
}
