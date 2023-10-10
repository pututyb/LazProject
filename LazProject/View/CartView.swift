//
//  CartView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 03/10/23.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var cartVM = CartViewModel()
    @StateObject private var signInVM = SignInViewModel()
    
    @State private var totalItem = 1
    @State private var jumlahBarang = 5
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(cartVM.carts, id: \.id) { cart in
                    HStack(spacing: 0) {
                        AsyncImage(url: cart.images[0]) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .background(Color("btnColor"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            case .failure:
                                Text("Failed to load image")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text(cart.title)
                                .font(.system(size: 13))
                            
                            Text("$\(cart.price * totalItem)")
                                .font(.system(size: 11))
                            
                            HStack(spacing: 15) {
                                Button(action: {
                                    totalItem -= 1
                                    print("less more")
                                }) {
                                    Image(systemName: "arrow.down")
                                        .foregroundStyle(Color.gray)
                                        .padding(4)
                                        .background(
                                            Circle()
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                                .disabled(totalItem == 0)
                                
                                Text(String(totalItem))
                                    .font(.system(size: 13, weight: .semibold))
                                
                                Button(action: {
                                    totalItem += 1
                                    print("add more")
                                }) {
                                    Image(systemName: "arrow.up")
                                        .foregroundStyle(Color.gray)
                                        .padding(4)
                                        .background(
                                            Circle()
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    //delete cart item
                                    cartVM.deleteCartItem(cartID: cart.id)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundStyle(Color.gray)
                                        .padding(4)
                                        .background(
                                            Circle()
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                                .padding(.trailing)
                            }
                        }
                        .padding(.leading)
                    }
                    .padding()
                }
                
                HStack {
                    Text("Delivery Address")
                        .font(.custom("Inter-SemiBold", size: 17))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.right")
                            .foregroundStyle(Color.primary)
                    }
                    .padding(.trailing)
                }
                .padding(.top)
                
                HStack {
                    Image("map")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "mappin.circle.fill")
                                .foregroundStyle(Color.orange)
                        )
                        .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text(signInVM.user?.name ?? "Default")
                            .font(.custom("Inter-Mdeium", size: 15))
                        
                        Text("Sylhet")
                            .font(.custom("Inter-Regular", size: 13))
                            .foregroundStyle(Color.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundStyle(Color.green)
                        .padding(.trailing)
                }
                
                HStack {
                    Text("Payment Method")
                        .font(.custom("Inter-SemiBold", size: 17))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.right")
                            .foregroundStyle(Color.primary)
                    }
                    .padding(.trailing)
                }
                .padding(.top)
                
                HStack {
                    Image("visa")
                        .frame(width: 50, height: 50)
                        .background(Color("btnColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("Visa Classic")
                            .font(.custom("Inter-Mdeium", size: 15))
                        
                        Text("**** 7690")
                            .font(.custom("Inter-Regular", size: 13))
                            .foregroundStyle(Color.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundStyle(Color.green)
                        .padding(.trailing)
                }
                
                VStack(alignment: .leading) {
                    Text("Order Info")
                        .font(.custom("Inter-SemiBold", size: 17))
                        .padding()
                    
                    HStack {
                        Text("Subtotal")
                            .font(.custom("Inter-Regular", size: 15))
                            .padding(.leading)
                        Spacer()
                        Text("$110")
                            .padding(.trailing)
                            .font(.custom("Inter-SemiBold", size: 15))
                    }
                    
                    HStack {
                        Text("Shipping cost")
                            .font(.custom("Inter-Regular", size: 15))
                            .padding(.leading)
                        Spacer()
                        Text("$10")
                            .padding(.trailing)
                            .font(.custom("Inter-SemiBold", size: 15))
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Text("Total")
                            .font(.custom("Inter-Regular", size: 15))
                            .padding(.leading)
                        Spacer()
                        Text("$120")
                            .padding(.trailing)
                            .font(.custom("Inter-SemiBold", size: 15))
                    }
                    .padding(.top, 10)
                }
                
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            VStack {
                Button(action: {
                    print("Checkout Success")
                }) {
                    Text("Checkout")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("btnPrimary"))
                }
            }
            .padding(.bottom)
        }
        .onAppear {
            cartVM.fetchProduct()
            signInVM.fetchUsers()
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
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CartView()
}
