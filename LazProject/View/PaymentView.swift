//
//  PaymentView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 12/10/23.
//

import SwiftUI

enum CardType {
    case visa
    case mastercard
    case unknown
}

struct PaymentView: View {
    @State private var cardHolder: String = ""
    @State private var cardNumber: String = ""
    @State private var cardExp: String = ""
    @State private var cardCvv: String = ""
    @State private var savedCard = true
    
    
    var cardType: CardType {
        guard cardNumber.isEmpty == false else {
            return .unknown
        }
        
        guard let firstDigit = cardNumber.first else {
            return .unknown
        }
        
        switch firstDigit {
        case "4":
            return .visa
        case "5":
            return .mastercard
        default:
            return .unknown
        }
    }
    var cardImageName: String {
        switch cardType {
        case .visa:
            return "visa"
        case .mastercard:
            return "mastercard"
        default:
            return "logo"
        }
    }
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<4) { index in
                            VStack (alignment: .leading) {
                                HStack {
                                    Text(cardHolder)
                                        .foregroundStyle(.white)
                                        .font(.custom("Inter-Regular", size: 15))
                                    
                                    
                                    Spacer()
                                    
                                    Image(cardImageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                Spacer()
                                
                                Text(cardNumber.isEmpty ? "" : (cardType == .visa ? "Visa" : "MasterCard"))
                                    .foregroundStyle(.white)
                                    .font(.custom("Inter-Regular", size: 15))
                                    .padding(.leading)
                                    .padding(.bottom)
                                
                                HStack {
                                    Text(cardNumber)
                                        .foregroundStyle(.white)
                                        .font(.custom("Inter-Regular", size: 15))
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Text(cardCvv)
                                        .foregroundStyle(.white)
                                        .font(.custom("Inter-Regular", size: 15))
                                        .padding(.trailing)
                                }
                                .padding(.bottom)
                                
                                Text(cardExp)
                                    .foregroundStyle(.white)
                                    .font(.custom("Inter-Regular", size: 15))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                            .frame(width: 320, height: 185)
                            .background(Color("btnPrimary"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                
                Button(action: {
                    print("Add new card")
                }) {
                    HStack {
                        Image(systemName: "plus.square")
                        Text("Add new card")
                    }
                    .foregroundStyle(Color.purple)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.purple .opacity(0.18))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .padding()
                }
                
                Text("Cardholder Name")
                    .font(.custom("Inter-SemiBold", size: 17))
                    .padding(.leading)
                
                TextField("Cardholder Name", text: $cardHolder)
                    .font(.custom("Inter-Regular", size: 15))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .background(Color("btnColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .autocorrectionDisabled()
                
                Text("Card Number")
                    .font(.custom("Inter-SemiBold", size: 17))
                    .padding(.leading)
                
                TextField("4111 1111 1111 1111", text: $cardNumber)
                    .font(.custom("Inter-Regular", size: 15))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    .background(Color("btnColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .onChange(of: cardNumber) {
                        if cardNumber.count > 19 {
                            cardNumber = String(cardNumber.prefix(19))
                        }
                        cardNumber = formatCardNumber(cardNumber)
                    }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("EXP")
                            .font(.custom("Inter-SemiBold", size: 17))
                            .padding(.leading)
                        
                        TextField("12/24", text: $cardExp)
                            .font(.custom("Inter-Regular", size: 15))
                            .padding(.leading)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .background(Color("btnColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            .onChange(of: cardExp) {
                                if cardExp.count > 5 {
                                    cardExp = String(cardExp.prefix(5))
                                }
                                cardExp = formatCardExp(cardExp)
                            }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("CVV")
                            .font(.custom("Inter-SemiBold", size: 17))
                            .padding(.leading)
                        
                        TextField("780", text: $cardCvv)
                            .font(.custom("Inter-Regular", size: 15))
                            .padding(.leading)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .background(Color("btnColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            .onChange(of: cardCvv) {
                                cardCvv = String(cardCvv.prefix(3))
                            }
                    }
                }
                
                HStack {
                    Text("Save card info")
                        .font(.custom("Inter-Regular", size: 15))
                        .padding()
                    
                    Toggle("", isOn: $savedCard)
                        .scaleEffect(0.8)
                }
                
                Spacer()
                
                Button(action: {
                    print("Save Card")
                }) {
                    Text("Save Card")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("btnPrimary"))
                }
                .padding(.bottom)
                
            }
        }
        
    }
    
    func formatCardNumber(_ cardNumber: String) -> String {
        let strippedCardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
        var formattedCardNumber = ""
        for (index, character) in strippedCardNumber.enumerated() {
            if index > 0 && index % 4 == 0 {
                formattedCardNumber += " "
            }
            formattedCardNumber.append(character)
        }
        return formattedCardNumber
    }
    
    func formatCardExp(_ cardExp: String) -> String {
        var formattedCardExp = cardExp
        if formattedCardExp.count == 3 && !formattedCardExp.contains("/") {
            let startIndex = formattedCardExp.startIndex
            let thirdPosition = formattedCardExp.index(startIndex, offsetBy: 2)
            formattedCardExp.insert("/", at: thirdPosition)
        }
        if formattedCardExp.last == "/" {
            formattedCardExp.removeLast()
        }
        formattedCardExp = String(formattedCardExp.prefix(5))
        
        return formattedCardExp
    }
}

#Preview {
    PaymentView()
}
