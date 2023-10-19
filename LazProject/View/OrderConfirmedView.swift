//
//  OrderConfirmedView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 15/10/23.
//

import SwiftUI

struct OrderConfirmedView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                
                Circle()
                    .trim(from: 0.5, to: 1)
                    .stroke(lineWidth: 2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .rotationEffect(.degrees(0))
                    .offset(x: (geometry.size.width / 2) - (geometry.size.width / 2), y: (geometry.size.height / 2) - (geometry.size.height / 2))
                
                Circle()
                    .trim(from: 0.5, to: 1)
                    .stroke(lineWidth: 2)
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(0))
                    .offset(x: (geometry.size.width / 2) - (geometry.size.width / 2), y: (geometry.size.height / 2) - (geometry.size.height / 2.05))
                
                Circle()
                    .trim(from: 0.5, to: 1)
                    .stroke(lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(0))
                    .offset(x: (geometry.size.width / 2) - (geometry.size.width / 2), y: (geometry.size.height / 2) - (geometry.size.height / 2.1))
                
                VStack {
                    Spacer()
                    
                    Image("order-confirmed")
                        .resizable()
                        .frame(width: 280, height: 230)
                        .padding()
                    
                    Text("Order Confirmed!")
                        .font(.custom("Inter-SemiBold", size: 28))
                    
                    Text("Your order has been confirmed, we will send you confirmation email shortly.")
                        .font(.custom("Inter-Regular", size: 15))
                        .opacity(0.8)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Go to Orders")
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color("btnColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    OrderConfirmedView()
}
