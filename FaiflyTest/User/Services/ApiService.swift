//
//  ApiService.swift
//  FaiflyTest
//
//  Created by Сергій on 22.03.2025.
//

import Foundation

struct APIService {
    func fetchUsers(page: Int) async throws -> ([User], String) {
        guard let url = URL(string: "https://reqres.in/api/users?page=\(page)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(UserResponse.self, from: data)
        return (response.data, response.support.text)
    }
}
