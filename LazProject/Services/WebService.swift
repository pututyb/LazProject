//
//  WebService.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 24/09/23.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case encodingError
    case requestFailed
    case serverError
    case invalidResponse
}

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let access_token: String?
    let refresh_token: String?
}

class WebService {
    
    ///MARK: THIS IS FOR USRES AND LOGIN
    
    func login(email: String, password: String, completion: @escaping (Result<(String, String), AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/auth/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let accsess_token = loginResponse.access_token, let refresh_token = loginResponse.refresh_token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success((accsess_token, refresh_token)))
            
        }.resume()
        
    }
    
    func getUsers(accessToken: String, completion: @escaping (Result<Users, NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/auth/profile") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let usersResponse = try JSONDecoder().decode(Users.self, from: data)
                completion(.success(usersResponse))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    ///MARK: THIS IS FOR CATEGORIES
    
    func getCategories(completion: @escaping (Result<[Category], NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode([Category].self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    ///MARK: THIS IS FOR PRODUCT
    
    func getAllProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getProductByTitle(title: String, completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        let urlString = "https://api.escuelajs.co/api/v1/products/?title=\(title)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    ///MARK: THIS IS FOR CART
    
    func getAllCarts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/products") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func createCart(cart: Product, completion: @escaping (Result<Product, NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/products") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(cart)
            request.httpBody = jsonData
        } catch {
            completion(.failure(.encodingError))
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let createdCart = try JSONDecoder().decode(Product.self, from: data)
                completion(.success(createdCart))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func deleteCartItem(cartID: Int, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/products/\(cartID)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            
            switch response.statusCode {
            case 200:
                // Successfully deleted the cart item
                completion(.success(()))
            case 404:
                // Cart item with the provided ID not found
                completion(.failure(.invalidResponse))
            default:
                // Handle other status codes as needed
                completion(.failure(.serverError))
            }
            
        }.resume()
    }
    
    
    ///MARK THIS FOR PAYMENT
    
    func getPayments(completion: @escaping (Result<[Payment], NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/payments/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let payments = try JSONDecoder().decode([Payment].self, from: data)
                completion(.success(payments))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func createPayment(payment: Payment, completion: @escaping (Result<Payment, NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/payments") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(payment)
            request.httpBody = jsonData
        } catch {
            completion(.failure(.encodingError))
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let createPayment = try JSONDecoder().decode(Payment.self, from: data)
                completion(.success(createPayment))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    
}
