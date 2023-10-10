//
//  SignInViewModel.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 24/09/23.
//

import Foundation

class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isAuthenticated: Bool = false
//    @Published var modelUsers: [Users] = []
    @Published var user: Users?
    
    func login() {
        
        let defaults = UserDefaults.standard
        
        WebService().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token.0, forKey: "access_token")
                defaults.setValue(token.1, forKey: "refresh_token")
                print("Access_Token: \(token.0)")
                print("Refresh_Token: \(token.1)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchUsers() {
        let defaults = UserDefaults.standard
        
        guard let accessToken = defaults.value(forKey: "access_token") as? String else {
            print("access_token Not Found")
            return
        }
        
        WebService().getUsers(accessToken: accessToken) { result in
            switch result {
            case.success(let users):
                DispatchQueue.main.async {
                    self.user = users
                    print("Fetch Users : \(users)")
                }
            case.failure(let error):
                print("Error fetching profile: \(error.localizedDescription)")
            }
        }
    }
    
    
    func logout() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: "access_token")
        defaults.removeObject(forKey: "refresh_token")
        
        if let access_token = defaults.value(forKey: "access_token") as? String, let refresh_token = defaults.value(forKey: "refresh_token") as? String {
            print("Access Token: \(access_token)")
            print("Refresh Token: \(refresh_token)")
        } else {
            print("Token All Delete")
        }
    }
}
