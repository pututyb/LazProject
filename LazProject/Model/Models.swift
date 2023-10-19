//
//  Users.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 24/09/23.
//

import Foundation

struct Users: Codable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
}

struct Category: Codable {
    let id: Int
    let name: String
    let image: URL
}

struct Product: Codable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let category: Category
    let images: [URL]
}

struct Payment: Codable, Hashable {
    let cardHolder: String
    let cardType: String
    let cardNumber: String
    let cardExp: String
    let cardCvv: String
}
