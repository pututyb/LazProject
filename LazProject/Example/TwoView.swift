//
//  TwoView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 03/10/23.
//

import SwiftUI

struct TwoView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var move = false
    
    var body: some View {
        VStack {
            Text("Two View")
            
            Button(action :{
                move = true
            }) {
                Text("Move")
            }
            .navigationDestination(isPresented: $move) {
                ThreeView()
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
    TwoView()
}
