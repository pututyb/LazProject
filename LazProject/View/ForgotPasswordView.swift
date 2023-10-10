//
//  ForgotPasswordView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 21/09/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var going = false
    
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
                    
                    
                    
                    Text("Email Address")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    TextField("Email Address", text: $email)
                        .padding()
                        .textInputAutocapitalization(.never)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2)
                            }
                        )
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("Please write your email to receive a confirmation code to set a new password.")
                        .font(.system(size: 13))
                        .frame(width: 263, height: 36)
                        .foregroundStyle(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                        
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
                                .padding(.vertical)
                        }
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ForgotPasswordView()
}
