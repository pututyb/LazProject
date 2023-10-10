//
//  SignInView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 20/09/23.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    
    @StateObject private var signinVM = SignInViewModel()

    @State private var rememberMe = true
    @State private var showPassword = false
    @State private var readyToNavigate: Bool = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                    
                    
                VStack {
                    Text("Welcome")
                        .font(.system(size: 28, weight: .semibold))
                    Text("Please enter your data to continue")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                    
                    Text("Email Address")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    TextField("Email Address", text: $signinVM.email)
                        .padding()
                        .textInputAutocapitalization(.never)
                        .cornerRadius(10)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2)
                                if !signinVM.email.isEmpty {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                        .font(.system(size: 18))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .padding(.trailing)
                                }
                            }
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    if showPassword {
                        HStack {
                            TextField("Password", text: $signinVM.password)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .cornerRadius(10)
                            
                            if !signinVM.password.isEmpty {
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
                            SecureField("Password", text: $signinVM.password)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .cornerRadius(10)
                            
                            if !signinVM.password.isEmpty {
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
                    
                    HStack{
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 12))
                        
                        Text("8 characters (18 max)")
                            .font(.system(size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Button(action: {
                        
                    }) {
                        Text("Forgot password?")
                            .foregroundStyle(Color.red)
                            .font(.system(size: 14))
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                    
                    
                    HStack {
                        Text("Remember me")
                            .font(.system(size: 13))
                            .padding(.leading)
                        
                        Toggle("", isOn: $rememberMe)
                            .scaleEffect(0.8)
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    Text("By connecting your account confirm that you agree")
                        .font(.system(size: 13))
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 1) {
                        Text("with our")
                            .font(.system(size: 13))
                        
                        Button(action: {
                            
                        }) {
                            Text("Term and Condition")
                                .foregroundStyle(Color.primary)
                                .font(.system(size: 13, weight: .semibold))
                        }
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                        isLoading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            signinVM.login()
                            signinVM.isAuthenticated = true
                        }
                        
                    }) {
                        Text("Login")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .navigationDestination(isPresented: $signinVM.isAuthenticated) {
                        DashboardNavigation()
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
                .blur(radius: isLoading ? 3: 0)
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(3.5)
                }
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignInView()
}
