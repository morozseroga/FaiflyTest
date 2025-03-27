//
//  FavoritesListView.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import SwiftUI
import RealmSwift

struct FavoritesListView: View {
    @ObservedResults(FavoriteUser.self) var favorites
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorites, id: \.email) { favorite in
                    if let user = favorite.asUser {
                        NavigationLink(destination: UserDetailsView(user: user, supportText: nil)) {
                            UserRow(user: user)
                        }
                    }
                }
            }
            .navigationTitle("Улюблені")
        }
    }
}

#Preview {
    FavoritesListView()
}
