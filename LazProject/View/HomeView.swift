//
//  HomeView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var signinVM = SignInViewModel()
    @StateObject private var homeVM = HomeViewModel()
    
    @State private var search = ""
    @State private var cartView = false
    
    
    let gridItems = [
        GridItem(.flexible(minimum: 100, maximum: 210)),
        GridItem(.flexible(minimum: 100, maximum: 210)),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Hello")
                            .font(.system(size: 32, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading)
                    }
                    .padding(.top)
                    
                    Text("Welcome to Laza.")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    HStack(spacing: 0) {
                        TextField("Search", text: $search)
                            .padding()
                            .textInputAutocapitalization(.never)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                            .padding(.leading)
                            .padding(.vertical)
                            .autocorrectionDisabled()
                            .onChange(of: search) {
                                homeVM.fetchProductsByTitle(title: search)
                            }
                        
                        Button(action: {
                            
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("btnPrimary"))
                                .frame(width: 54, height: 54)
                                .overlay(
                                    Image(systemName: "mic")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                )
                        }
                        .padding()
                    }
                    
                    
                    HStack {
                        Text("Choose Brand")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("View All")
                                .font(.system(size: 13,  weight: .medium))
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(homeVM.categories, id: \.id) { category in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.blue)
                                    .frame(width: 250, height: 50)
                                    .overlay(
                                        HStack {
                                            Image(systemName: "bell.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.white)
                                            Text(category.name)
                                                .foregroundColor(.white)
                                        }
                                    )
                            }
                        }
                        .onAppear {
                            homeVM.fetchCategory()
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding(.horizontal, 40)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .padding(.horizontal)
                    
                    HStack {
                        Text("New Arraival")
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("View All")
                                .font(.system(size: 13,  weight: .medium))
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.vertical) {
                        LazyVStack {
                            LazyVGrid(columns: gridItems) {
                                ForEach(homeVM.products, id: \.id) { product in
                                    NavigationLink(destination: ProductDetailView(product: product)) {
                                        VStack {
                                            if let imageURL = product.images.first {
                                                AsyncImage(url: imageURL) { image in
                                                    VStack {
                                                        ZStack(alignment: .topTrailing) {
                                                            image
                                                                .resizable()
                                                                .frame(width: 170, height: 210)
                                                                .background(Color.blue)
                                                                .cornerRadius(15)
                                                            
                                                            Button(action: {
                                                                print("I Like \(product.title)")
                                                            }) {
                                                                Image(systemName: "suit.heart")
                                                                    .resizable()
                                                                    .frame(width: 25, height: 25)
                                                                    .foregroundColor(.primary)
                                                            }
                                                            .padding(8)
                                                        }
                                                    }
                                                } placeholder: {
                                                    Color.gray
                                                        .frame(width: 170, height: 210)
                                                        .overlay(
                                                            ProgressView()
                                                                .foregroundStyle(Color.white)
                                                                .progressViewStyle(CircularProgressViewStyle())
                                                                .scaleEffect(1.5)
                                                        )
                                                }
                                            } else {
                                                Color.gray
                                                    .frame(width: 170, height: 210)
                                            }
                                            
                                            Text(product.title)
                                                .font(.system(size: 11))
                                                .foregroundStyle(Color.primary)
                                                .frame(width: 170, alignment: .leading)
                                                .multilineTextAlignment(.leading)
                                            
                                            Text("$\(product.price)")
                                                .font(.system(size: 13, weight: .bold))
                                                .foregroundStyle(Color.primary)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .frame(width: 170, alignment: .leading)
                                        }
                                    }
                                }
                            }
                        }
                        .onAppear {
                            homeVM.fetchProduct()
                        }
                    }
                    
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("Togle SideMenu")
                    }) {
                        Circle()
                            .foregroundColor(Color("bgButtonBack"))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "list.dash")
                                    .foregroundColor(Color.primary)
                            )
                            .padding(.bottom)
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        cartView = true
                    }) {
                        Circle()
                            .foregroundColor(Color("bgButtonBack"))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "cart")
                                    .foregroundColor(Color.primary)
                            )
                            .padding(.bottom)
                    }
                    .navigationDestination(isPresented: $cartView) {
                        CartView()
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
