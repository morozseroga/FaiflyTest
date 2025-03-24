//
//  RealmService.swift
//  FaiflyTest
//
//  Created by Сергій on 22.03.2025.
//

import Foundation
import RealmSwift

class RealmService {
    static let shared = RealmService()
    let realm = try! Realm()
    
    func addFavorite(_ user: User) {
        let favorite = FavoriteUser()
        favorite.id = user.id
        favorite.email = user.email
        favorite.first_name = user.first_name
        favorite.last_name = user.last_name
        favorite.avatar = user.avatar
        
        try! realm.write {
            realm.add(favorite)
        }
    }
    
    func removeFavorite(_ user: User) {
        let predicate = NSPredicate(format: "email = %@", user.email)
        guard let favorite = realm.objects(FavoriteUser.self).filter(predicate).first else { return }
        
        if favorite.isInvalidated {
            return
        }
        
        try! realm.write {
            realm.delete(favorite)
        }
    }
}
