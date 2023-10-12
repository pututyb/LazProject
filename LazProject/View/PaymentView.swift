//
//  PaymentView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 12/10/23.
//

import SwiftUI

struct PaymentView: View {
    @State private var cardHolder: String = ""
    @State private var cardNumber: String = ""
    @State private var cardExp: String = ""
    @State private var cardCvv: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                print("Add new card")
            }) {
                HStack {
                    Image(systemName: "plus.square")
                    Text("Add new card")
                }
                .foregroundStyle(Color.purple)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.purple .opacity(0.1))
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
                }
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
        let strippedCardExp = cardExp.replacingOccurrences(of: " ", with: "")
        var formattedCardExp = ""
        if strippedCardExp.count > 5 {
            return String(strippedCardExp.prefix(5))
        }
        if strippedCardExp.count <= 2 {
            formattedCardExp = strippedCardExp
        } else if strippedCardExp.count == 4 {
            formattedCardExp = String(strippedCardExp.prefix(2)) + "/" + String(strippedCardExp.suffix(2))
        } else {
            formattedCardExp = strippedCardExp
        }
        return formattedCardExp
    }
    
    
}

#Preview {
    PaymentView()
}
