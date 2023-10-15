//
//  CreditCard.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 15/10/23.
//

import SwiftUI

struct CreditCard: View {
    
    @Binding var cardHolder: String
    @Binding var cardNumber: String
    @Binding var cardExp: String
    @Binding var cardCvv: String
    
    var body: some View {
        VStack(alignment: .leading) {
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
    CreditCard(cardHolder: .constant(""), cardNumber: .constant(""), cardExp: .constant(""), cardCvv: .constant(""))
}
