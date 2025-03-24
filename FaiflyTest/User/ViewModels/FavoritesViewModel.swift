//
//  FavoritesViewModel.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import Foundation
import RealmSwift

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [FavoriteUser] = []
    @Published var error: Error?
    
    private let realmService = RealmService()
    
    func loadFavorites() {
        DispatchQueue.main.async {
            let realm = try! Realm()
            self.favorites = Array(realm.objects(FavoriteUser.self))
        }
    }
    
    func toggleFavorite(_ user: User) {
        do {
            let realm = try Realm()
            let predicate = NSPredicate(format: "email = %@", user.email)
            let existing = realm.objects(FavoriteUser.self).filter(predicate).first
            
            if let existing = existing {
                try realm.write {
                    realm.delete(existing)
                }
            } else {
                let favorite = FavoriteUser()
                favorite.email = user.email
                favorite.first_name = user.first_name
                favorite.last_name = user.last_name
                favorite.avatar = user.avatar
                
                try realm.write {
                    realm.add(favorite)
                }
            }
            loadFavorites()
        } catch {
            self.error = error
        }
    }
}

