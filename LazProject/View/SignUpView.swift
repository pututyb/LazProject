//
//  SignUpView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 19/09/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var rememberMe = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Sign Up")
                        .font(.custom("Inter-SemiBold", size: 28))
                    
                    Spacer()
                    
                    Text("Username")
                        .foregroundColor(.gray)
                        .font(.custom("Inter-Regular", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .font(.custom("Inter-Medium", size: 15))
                        .textInputAutocapitalization(.never)
                        .cornerRadius(10)
                        .onChange(of: username) {
                            if username.count >= 12 {
                                username = String(username.prefix(12))
                            }
                        }
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2)
                                if !username.isEmpty {
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
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .font(.custom("Inter-Medium", size: 15))
                        .cornerRadius(10)
                        .onChange(of: password) {
                            if password.count >= 12 {
                                password = String(password.prefix(18))
                            }
                        }
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2)
                                if !password.isEmpty {
                                    Text("Strong")
                                        .foregroundColor(.green)
                                        .font(.system(size: 11))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .padding(.trailing)
                                }
                            }
                        )
                        .padding(.horizontal)
                    
                    HStack{
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 12))
                        
                        Text("8 characters (18 max)")
                            .font(.system(size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Text("Email Address")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    TextField("Email Address", text: $email)
                        .padding()
                        .font(.custom("Inter-Medium", size: 15))
                        .textInputAutocapitalization(.never)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2)
                                if !email.isEmpty {
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
                    
                    HStack {
                        Text("Remember me")
                            .font(.custom("Inter-Medium", size: 13))
                            .padding(.leading)
                        
                        Toggle("", isOn: $rememberMe)
                            .scaleEffect(0.8)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .font(.custom("Inter-SemiBold", size: 17))
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
        .navigationBarBackButtonHidden(true)
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
