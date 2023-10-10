//
//  AddReviewView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 02/10/23.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var signinVM = SignInViewModel()
    
    @State private var messageBody = "Describe your experience?"
    @State private var rating = 0.0
    
    var body: some View {
        VStack {
            if let user = signinVM.user {
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
            }
            
            
            Text("How was your experience ?")
                .font(.custom("Inter-SemiBold", size: 17))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextEditor(text: $messageBody)
                .scrollContentBackground(.hidden)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .foregroundStyle(Color.gray)
                .background(Color("btnColor"))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
            
            Text("Star")
                .font(.custom("Inter-SemiBold", size: 17))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            HStack {
                
                Text("0.0")
                    .padding(.leading)
                
                Slider(value: $rating, in: 0.0...5.0, step: 0.1)
                    .tint(Color.purple)
                    .padding(.horizontal)
                
                Text("5.0")
                    .padding(.trailing)
            }
            
            HStack {
                Text(String(format: "%.1f", rating))
                
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.yellow)
            }
            
            Spacer()
            
            
            VStack {
                Button(action: {
                    print("Submit Review Succeess")
                }) {
                    Text("Submit Review")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
            }
            .padding(.bottom)
            
        }
        .onAppear {
            signinVM.fetchUsers()
        }
        .navigationBarBackButtonHidden(true)
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
        .padding(.top)
        .navigationTitle("Add Review")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    AddReviewView()
}
