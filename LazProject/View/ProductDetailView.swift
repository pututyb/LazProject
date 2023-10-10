//
//  ProductDetailView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 28/09/23.
//

import SwiftUI

struct ViewPointKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var cartVM = CartViewModel()
    @State private var isAddedToCart = false
    
    let product: Product
    @State private var selectedImageIndex = 0
    
    @State private var selectedSize: String?
    let sizes = ["S", "M", "L", "XL", "2XL"]
    
    @State private var isDescriptionExpand = false
    
    @State private var showAllReviews = false
    @State private var showCart = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TabView(selection: $selectedImageIndex) {
                    ForEach(product.images.indices, id: \.self) { index in
                        AsyncImage(url: product.images[index]) { image in
                            image
                                .image?.resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        }
                        .tag(index)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.category.name)
                            .font(.system(size: 13))
                            .padding(.leading)
                        
                        Text(product.title)
                            .font(.system(size: 22, weight: .semibold))
                            .fontWeight(.bold)
                            .padding(.leading)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.system(size: 13))
                        
                        Text("$\(product.price)")
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.trailing)
                    }
                }
                .padding(.vertical)
                
                LazyHStack {
                    ForEach(product.images, id: \.self) { imageURL in
                        AsyncImage(url: imageURL) { image in
                            image
                                .image?
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                    }
                }
                .padding()
                
                HStack {
                    Text("Size")
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Size Guide")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.gray)
                            .padding(.trailing)
                    }
                }
                .padding(.bottom)
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    ForEach(sizes, id: \.self) { size in
                        Button(action: {
                            if selectedSize == size {
                                selectedSize = nil
                            } else {
                                selectedSize = size
                            }
                        }) {
                            Text(size)
                                .font(.custom("Inter-SemiBold", size: 17))
                                .foregroundStyle(Color.primary)
                                .frame(width: 60, height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(selectedSize == size ? Color.purple : Color("btnColor"))
                                )
                        }
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
                
                ///DESCRIPTION
                Group {
                    Text("Description")
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.leading)
                    
                    if isDescriptionExpand {
                        Text(product.description)
                            .font(.system(size: 15))
                            .padding(.leading)
                        
                        Button(action: {
                            isDescriptionExpand.toggle()
                        }) {
                            Text("Read Less")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.purple)
                        }
                        .padding(.leading)
                    } else {
                        Text(product.description.prefix(50))
                            .font(.system(size: 15))
                            .padding(.leading)
                        
                        Button(action: {
                            isDescriptionExpand.toggle()
                        }) {
                            Text("Read More")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.purple)
                        }
                        .padding(.leading)
                    }
                }
                
                HStack {
                    Text("Reviews")
                        .font(.custom("Inter-SemiBold", size: 17))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        showAllReviews = true
                    }) {
                        Text("View All")
                            .font(.custom("Inter-Regular", size: 13))
                            .foregroundStyle(Color.gray)
                            .padding(.trailing)
                    }
                    .navigationDestination(isPresented: $showAllReviews) {
                        ReviewsView()
                    }
                }
                .padding(.vertical)
                
                ForEach(0..<2) {_ in
                    VStack {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 40))
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text("Jenny Wilson")
                                    .font(.system(size: 15, weight: .medium))
                                HStack(spacing: 5) {
                                    Image(systemName: "clock")
                                        .font(.system(size: 11))
                                    
                                    Text("13 Sep, 2020")
                                        .font(.system(size: 11, weight: .light))
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                HStack(spacing: 5) {
                                    Text("4.8")
                                    
                                    Text("rating")
                                        .font(.system(size: 11, weight: .light))
                                }
                                
                                StarRatingView(rating: 4.8)
                            }
                            .padding(.trailing)
                        }
                        
                        Text("Impressive product, but there is room for improvement.")
                            .frame(maxWidth: .infinity, maxHeight: 65, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                
            }
        }
        .refreshable {
            print("Refreshing done!")
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
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
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    showCart = true
                }) {
                    Circle()
                        .foregroundColor(Color("bgButtonBack"))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "cart")
                                .foregroundColor(Color.primary)
                        )
                }
            }
        }
        
        VStack {
            Text("Total Price")
                .font(.custom("Inter-SemiBold", size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            HStack{
                Text("with VAT,SD")
                    .font(.custom("Inter-Regular", size: 11))
                    .foregroundStyle(Color.gray)
                    .padding(.leading)
                
                Spacer()
                
                Text("$\(product.price)")
                    .font(.custom("Inter-SemiBold", size: 17))
                    .padding(.trailing)
            }
            
            
            Button(action: {
                isAddedToCart = true
                cartVM.addProductToCart(cart: product)
                
            }) {
                Text(isAddedToCart ? "Added to Cart" : "Add To Cart")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isAddedToCart ? Color.gray : Color.purple)
            .disabled(isAddedToCart)
            
        }
        
        Spacer()
    }
    
}

#Preview {
    ProductDetailView(product: Product(id: 1, title: "Product Title", price: 100, description: "This is a product description.", category: Category(id: 1, name: "Category Name", image: URL(string: "https://picsum.photos/640/640?r=293")!), images: [URL(string: "https://picsum.photos/640/640?r=2991")!, URL(string: "https://picsum.photos/640/640?r=405")!]))
}
