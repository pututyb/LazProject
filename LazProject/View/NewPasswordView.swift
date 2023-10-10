//
//  NewPasswordView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 21/09/23.
//

import SwiftUI

struct NewPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("New Password")
                        .font(.system(size: 28, weight: .semibold))
                    
                    Spacer()
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    if showPassword {
                        HStack {
                            TextField("Password", text: $password)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .cornerRadius(10)
                            
                            if !password.isEmpty {
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 18))
                                }
                                .padding(.trailing)
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                    } else {
                        HStack {
                            SecureField("Password", text: $password)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .cornerRadius(10)
                            
                            if !password.isEmpty {
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 18))
                                }
                                .padding(.trailing)
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                    Text("Confirm Password")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    if showConfirmPassword {
                        HStack {
                            TextField("Confirm Password", text: $confirmPassword)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .cornerRadius(10)
                            
                            if !confirmPassword.isEmpty {
                                Button(action: {
                                    showConfirmPassword.toggle()
                                }) {
                                    Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 18))
                                }
                                .padding(.trailing)
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                    } else {
                        HStack {
                            SecureField("Confirm Password", text: $confirmPassword)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .cornerRadius(10)
                            
                            if !confirmPassword.isEmpty {
                                Button(action: {
                                    showConfirmPassword.toggle()
                                }) {
                                    Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 18))
                                }
                                .padding(.trailing)
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                    Spacer()
                    
                    Text("Please write your new password.")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 13, weight: .regular))
                        .padding()
                    
                    Button(action: {
                        // Action
                    }) {
                        Text("Reset Password")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                }
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

#Preview {
    NewPasswordView()
}
