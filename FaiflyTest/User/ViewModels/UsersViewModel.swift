//
//  UsersViewModel.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var supportText: String? = nil
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var currentPage = 1
    private var hasMorePages = true
    private let apiService = APIService()
    
    @MainActor
    func loadMoreUsers() async {
        guard !isLoading, hasMorePages else { return }
        isLoading = true

        do {
            let (newUsers, support) = try await apiService.fetchUsers(page: currentPage)
            supportText = support
            if newUsers.isEmpty {
                hasMorePages = false
            } else {
                users.append(contentsOf: newUsers)
                currentPage += 1
            }
        } catch {
            errorMessage = "Помилка завантаження: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
