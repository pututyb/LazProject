//
//  AddressView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 12/10/23.
//

import SwiftUI

struct AddressView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var signInVM = SignInViewModel()
    
    @State private var phone = "+62 8516-3612-405"
    @State private var rememberMe = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = signInVM.user {
                Text("Name")
                    .font(.custom("Inter-SemiBold", size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                Text(user.name)
                    .font(.custom("Inter-Regular", size: 15))
                    .foregroundStyle(.gray)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .background(Color("btnColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                HStack {
                    VStack {
                        Text("Country")
                            .font(.custom("Inter-SemiBold", size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading)
                        
                        Text(user.role)
                            .font(.custom("Inter-Regular", size: 15))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .background(Color("btnColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.leading)
                    }
                    
                    VStack {
                        Text("City")
                            .font(.custom("Inter-SemiBold", size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading)
                        
                        Text(user.password)
                            .font(.custom("Inter-Regular", size: 15))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .background(Color("btnColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing)
                    }
                }
                
                Text("Phone")
                    .font(.custom("Inter-SemiBold", size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                TextField("Phone", text: $phone)
                    .font(.custom("Inter-Regular", size: 15))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .background(Color("btnColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                Text("Address")
                    .font(.custom("Inter-SemiBold", size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                Text(user.avatar)
                    .font(.custom("Inter-Regular", size: 15))
                    .foregroundStyle(.gray)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .background(Color("btnColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                HStack {
                    Text("Save as primary address")
                        .font(.custom("Inter-SemiBold", size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    Toggle("", isOn: $rememberMe)
                        .padding()
                        .scaleEffect(0.8)
                    
                }
            }
            
            Spacer()
            
            VStack {
                Button(action: {
                    print("Save Address")
                }) {
                    Text("Save Address")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("btnPrimary"))
                }
            }
            .padding(.bottom)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
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
                }
            }
        }
        .navigationTitle("Address")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            signInVM.fetchUsers()
        }
    }
}

#Preview {
    AddressView()
}
