//
//  FavoritesListView.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import SwiftUI

struct FavoritesListView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        List(viewModel.favorites, id: \.email) { favorite in
            if let user = favorite.asUser {
                UserRow(user: user)
            }
        }
        .navigationTitle("Улюблене")
        .refreshable {
            viewModel.loadFavorites()
        }
        .onAppear {
            viewModel.loadFavorites()
        }
    }
}

#Preview {
    FavoritesListView()
}
