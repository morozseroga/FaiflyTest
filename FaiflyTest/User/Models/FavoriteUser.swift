//
//  FavoriteUser.swift
//  FaiflyTest
//
//  Created by Сергій on 22.03.2025.
//

import Foundation
import RealmSwift

@objcMembers class FavoriteUser: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var email: String = ""
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var avatar: String = ""
}

extension FavoriteUser {
    var isValid: Bool {
        !isInvalidated
    }
    
    var asUser: User? {
        guard isValid else { return nil }
        return User(
            id: 0,
            email: email,
            first_name: first_name,
            last_name: last_name,
            avatar: avatar
        )
    }
}
