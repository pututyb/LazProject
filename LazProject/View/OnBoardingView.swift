//
//  OnBoardingView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 19/09/23.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColorSplash")
                    .ignoresSafeArea()
                
                Image("person-chair")
                
                VStack {
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color("gs-btmView"))
                        .frame(width: 345, height: 244)
                        .cornerRadius(10)
                        .padding(.bottom)
                        .overlay(
                            VStack{
                                Text("Look Good, Feel Good")
                                    .font(.custom("Inter-SemiBold", size: 25))
                                    .frame(maxWidth: .infinity, maxHeight: 28)
                                
                                Text("Create your individual & unique style and look amazing everyday.")
                                    .foregroundColor(.gray)
                                    .font(.custom("Inter-Regular", size: 15))
                                    .frame(width: 294, height: 42)
                                    .multilineTextAlignment(.center)
                                
                                HStack {
                                    Button(action: {
                                        
                                    }) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 152, height: 60)
                                            .foregroundColor(Color("btnColor"))
                                            .overlay(
                                                Text("Men")
                                                    .font(.custom("Inter-Medium", size: 17))
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                    
                                    Button(action: {
                                        
                                    }) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 152, height: 60)
                                            .foregroundColor(Color("btnPrimary"))
                                            .overlay(
                                                Text("Women")
                                                    .font(.custom("Inter-Medium", size: 17))
                                                    .foregroundColor(.white)
                                            )
                                    }
                                }
                                
                                NavigationLink(destination: GetStartedView()) {
                                    Text("Skip")
                                        .font(.custom("Inter-Medium", size: 17))
                                        .foregroundColor(.gray)
                                        .padding(.top)
                                }
                            }
                        )
                }
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
