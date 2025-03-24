//
//  User.swift
//  FaiflyTest
//
//  Created by Сергій on 22.03.2025.
//

import Foundation

struct UserResponse: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
    let support: Support
}

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
    var fullName: String {
        "\(first_name) \(last_name)"
    }
}

struct Support: Codable {
    let url: String
    let text: String
}
