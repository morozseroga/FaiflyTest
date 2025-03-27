//
//  UsersListView.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import SwiftUI

struct UsersListView: View {
    
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: UserDetailsView(user: user,
                                                                supportText: viewModel.supportText)) {
                        UserRow(user: user)
                    }
                }
                
                if !viewModel.isLoading && viewModel.hasMorePages {
                    ProgressView()
                        .onAppear {
                            Task {
                                await viewModel.loadMoreUsers()
                            }
                        }
                }
            }
            .navigationTitle("Всі Користувачі")
            .refreshable {
                await viewModel.refreshUsers()
            }
        }
        .alert(isPresented: .init(get: { viewModel.errorMessage != nil }, set: { _ in viewModel.errorMessage = nil })) {
            Alert(title: Text("Помилка"), message: Text(viewModel.errorMessage ?? ""))
        }
    }
}

#Preview {
    UsersListView()
}
