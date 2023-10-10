//
//  CartViewModel.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 07/10/23.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var carts: [Product] = []
    
    func fetchProduct() {
        WebService().getAllCarts { result in
            switch result {
            case.success(let carts):
                DispatchQueue.main.async {
                    self.carts = carts
                    print(carts)
                }
            case.failure(let error):
                print("Error ViewModel Handling Fetch Cart: \(error)")
            }
        }
    }
    
    func addProductToCart(cart: Product) {
        WebService().createCart(cart: cart) { result in
            switch result {
            case .success(let createdProduct):
                DispatchQueue.main.async {
                    self.carts.append(createdProduct)
                    print("Successfully add to Cart")
                }
            case .failure(let error):
                print("Error ViewModel Handling Add to Cart: \(error)")
            }
        }
    }
    
    func deleteCartItem(cartID: Int) {
        WebService().deleteCartItem(cartID: cartID) { result in
            switch result {
            case.success:
                DispatchQueue.main.async {
                    self.carts.removeAll { $0.id == cartID}
                    print("Successfully deleted cart item with ID: \(cartID)")
                }
            case.failure(let error):
                print("Error ViewModel Handling Delete Cart Item: \(error)")
            }
        }
    }
    
}
