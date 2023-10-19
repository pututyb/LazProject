//
//  PaymentViewModel.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 15/10/23.
//

import Foundation

class PaymentViewModel: ObservableObject {
    @Published var payments: [Payment] = []
    
    func fetchPayments() {
        WebService().getPayments { result in
            switch result {
            case.success(let payment):
                DispatchQueue.main.async {
                    self.payments = payment
                    print(payment.first!)
                }
            case.failure(let error):
                print("Error ViewModel Handling Fetch Cart: \(error)")
            }
        }
    }
    
    func addPayments(payment: Payment) {
        WebService().createPayment(payment: payment) { result in
            switch result {
            case.success(let createPayment):
                DispatchQueue.main.async {
                    self.payments.append(createPayment)
                    print("Successfully add payment")
                }
            case.failure(let error):
                print("Error ViewModel Handling Add Payment: \(error)")
            }
        }
    }
}
