//
//  HomeViewModel.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 26/09/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    @Published var products: [Product] = []
    
    func fetchCategory() {
        WebService().getCategories { result in
            switch result {
            case.success(let categories):
                DispatchQueue.main.async {
                    self.categories = categories
                }
            case.failure(let error):
                print("Error ViewModel Handling Fetch Category: \(error)")
            }
        }
    }
    
    func fetchProduct() {
        WebService().getAllProducts { result in
            switch result {
            case.success(let products):
                DispatchQueue.main.async {
                    self.products = products
                }
            case.failure(let error):
                print("Error ViewModel Handling Fetch Category: \(error)")
            }
        }
    }
    
    func fetchProductsByTitle(title: String) {
        WebService().getProductByTitle(title: title) { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                }
            case .failure(let error):
                print("Error ViewModel Handling Fetch Products by Title: \(error)")
            }
        }
    }
    
}
