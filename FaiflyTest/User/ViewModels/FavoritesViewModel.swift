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
    
    func checkIsFavorite(_ user: User) -> Bool {
        return favorites.contains { $0.email == user.email && !$0.isInvalidated }
    }
    
    func toggleFavorite(_ user: User) {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "email = %@", user.email)
        
        if let existing = realm.objects(FavoriteUser.self).filter(predicate).first {
            try! realm.write {
                realm.delete(existing)
            }
            isFavorite = false
        } else {
            let favorite = FavoriteUser()
            favorite.id = user.id
            favorite.email = user.email
            favorite.first_name = user.first_name
            favorite.last_name = user.last_name
            favorite.avatar = user.avatar
            
            try! realm.write {
                realm.add(favorite)
            }
            isFavorite = true
        }
    }
}
