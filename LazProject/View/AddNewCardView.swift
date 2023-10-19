//
//  AddNewCardView.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 14/10/23.
//

import SwiftUI

struct AddNewCardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var paymentVM = PaymentViewModel()
    
    @State private var isPaymentAdded = false
    
    @State private var cardHolder: String = ""
    @State private var cardNumber: String = ""
    @State private var cardExp: String = ""
    @State private var cardCvv: String = ""
    
    var btnImages = ["mastercard", "paypal", "bank"]
    
    var btnTitle: String {
        switch selectedButton {
        case "mastercard":
            return "Add Card"
        case "paypal":
            return "Add Paypal"
        case "bank":
            return "Add Bank"
        default:
            return "Add Card"
        }
    }
    
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
    
    @State private var selectedButton: String?
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    ForEach(btnImages, id: \.self) { imageName in
                        Button(action: {
                            selectedButton = imageName
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(selectedButton == imageName ? Color("roseWhite") : Color("bgButtonBack"))
                                .frame(width: 100, height: 50)
                                .overlay(
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedButton == imageName ? Color.orange : Color.clear, lineWidth: 2)
                                )
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
                
                CreditCard(cardHolder: $cardHolder, cardNumber: $cardNumber, cardExp: $cardExp, cardCvv: $cardCvv)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    var cardType: String = "unknown"
                    
                    if !cardNumber.isEmpty {
                        if let firstDigit = cardNumber.first {
                            switch firstDigit {
                            case "4":
                                cardType = "visa"
                            case "5":
                                cardType = "mastercard"
                            default:
                                cardType = "unknown"
                            }
                        }
                    }
                    
                    let payment = Payment(
                        cardHolder: cardHolder,
                        cardType: cardType,
                        cardNumber: cardNumber,
                        cardExp: cardExp,
                        cardCvv: cardCvv
                    )
                    
                    // Use your PaymentViewModel to add the payment
                    paymentVM.addPayments(payment: payment)
                    
                    // Set a flag to indicate that the payment is added
                    isPaymentAdded = true
                }) {
                    Text(btnTitle)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .padding(.bottom)
                .alert(isPresented: $isPaymentAdded) {
                    Alert(
                        title: Text("Payment Added"),
                        message: Text("Your payment method has been added successfully."),
                        dismissButton: .default(Text("OK")) {
                            // You can do additional actions after the payment is added
                            presentationMode.wrappedValue.dismiss()
                        }
                    )
                }
            }
            .navigationBarBackButtonHidden(true)
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
            .padding(.top)
            .navigationTitle("Add New Card")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddNewCardView()
}
