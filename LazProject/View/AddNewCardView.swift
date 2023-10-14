//
//  AddNewCardView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 14/10/23.
//

import SwiftUI

struct AddNewCardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var btnImages = ["mastercard", "paypal", "logo"]
    
    
    @State private var selectedButton: String?
    
    var body: some View {
        VStack {
            HStack {
                ForEach(btnImages, id: \.self) { imageName in
                    Button(action: {
                        selectedButton = imageName
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(selectedButton == imageName ? Color("roseWhite") : Color("bgButtonBack"))
                            .frame(width: 100, height: 50)
                            .overlay(
                                Image(imageName)
                                    .font(.system(size: 26))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedButton == imageName ? Color.orange : Color.clear, lineWidth: 2)
                            )
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
            
            Spacer()
        }.navigationBarBackButtonHidden(true)
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
            .navigationTitle("Add New Card")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddNewCardView()
}
