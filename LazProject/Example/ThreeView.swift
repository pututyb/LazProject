//
//  ThreeView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 03/10/23.
//

import SwiftUI

struct ThreeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var move = false
    
    var body: some View {
        VStack {
            Text("Three View")
            
            Button(action :{
                dismiss()
            }) {
                Text("Dismiss")
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ThreeView()
}
