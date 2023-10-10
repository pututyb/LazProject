//
//  ReviewsView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 02/10/23.
//

import SwiftUI

struct ReviewsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var totalReviews = 245
    @State private var avgRates = 4.8
    
    @State private var addReview = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(totalReviews) Reviews")
                            .font(.custom("Inter-Medium", size: 15))
                            .padding(.leading)
                        HStack(spacing: 0) {
                            Text(String(format: "%.1f", avgRates))
                                .font(.custom("Inter-Regular", size: 15))
                            StarRatingView(rating: avgRates)
                            
                        }
                        .padding(.leading)
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    Button(action :{
                        addReview = true
                    }) {
                        HStack(spacing: 3) {
                            Image(systemName: "square.and.pencil")
                            Text("Add Review")
                                .font(.custom("Inter-SemiBold", size: 13))
                        }
                        .foregroundStyle(Color.white)
                        .frame(width: 130, height: 45)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.trailing)
                        .navigationDestination(isPresented: $addReview) {
                            AddReviewView()
                        }
                    }
                    
                }
                .padding(.vertical)
                
                ForEach(0..<5) {_ in
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
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
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
        .navigationTitle("Reviews")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StarRatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                if rating >= Double(index) + 1.0 {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 13))
                } else if rating >= Double(index) + 0.5 {
                    Image(systemName: "star.leadinghalf.fill")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 13))
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 13))
                }
            }
        }
    }
}



#Preview {
    ReviewsView()
}
