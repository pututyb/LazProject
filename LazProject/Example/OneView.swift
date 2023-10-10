//
//  OneView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 03/10/23.
//

import SwiftUI

struct OneView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var move = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("One View")
                
                Button(action :{
                    move = true
                }) {
                    Text("Move")
                }
                .navigationDestination(isPresented: $move) {
                    TwoView()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    OneView()
}
