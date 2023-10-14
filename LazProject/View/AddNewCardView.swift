//
//  AddNewCardView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 14/10/23.
//

import SwiftUI

struct AddNewCardView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color("bgButtonBack"))
                        .frame(width: 100, height: 50)
                        .overlay(
                            Image("mastercard")
                                .font(.system(size: 26))
                        )
                }
            }
        }
    }
}

#Preview {
    AddNewCardView()
}
