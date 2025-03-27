//
//  FavoritesViewModel.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import Foundation
import RealmSwift

class FavoritesViewModel: ObservableObject {
    @ObservedResults(FavoriteUser.self) var favorites
    
    @Published var isFavorite: Bool = false
    
    func updateIsFavorite(_ user: User) {
        isFavorite = favorites.contains { !$0.isInvalidated && $0.email == user.email }
    }
    
    func toggleFavorite(_ user: User) {
        let predicate = NSPredicate(format: "email = %@", user.email)
        if let existing = favorites.filter(predicate).first {
            $favorites.remove(existing)
            isFavorite = false
        } else {
            let favorite = FavoriteUser()
            favorite.id = user.id
            favorite.email = user.email
            favorite.first_name = user.first_name
            favorite.last_name = user.last_name
            favorite.avatar = user.avatar
            $favorites.append(favorite)
            isFavorite = true
        }
    }
}
