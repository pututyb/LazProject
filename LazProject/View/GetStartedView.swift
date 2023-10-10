//
//  GetStartedView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 19/09/23.
//

import SwiftUI

struct GetStartedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Let’s Get Started")
                        .font(.custom("Inter-SemiBold", size: 28))
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image("facebook")
                            
                            Text("Facebook")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 335, height: 50)
                        .background(Color(red: 0.26, green: 0.4, blue: 0.698))
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image("twitter")
                            
                            Text("Twitter")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 335, height: 50)
                        .background(Color(red: 0.1137, green: 0.6314, blue: 0.9490))
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image("google")
                            
                            Text("Google")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 335, height: 50)
                        .background(Color(red: 0.9176, green: 0.2627, blue: 0.2078))
                        .cornerRadius(10)
                    }
                    .padding(.bottom)
                    
                    Spacer()
                    
                    HStack(spacing: 5){
                        Text("Already have an account?")
                            .font(.custom("Inter-Regular", size: 15))
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: SignInView()) {
                            Text("Signin")
                                .font(.custom("Inter-SemiBold", size: 15))
                                .foregroundColor(Color.primary)
                        }
                    }
                    .padding(.bottom)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Create an Account")
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

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
