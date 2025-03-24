//
//  ContentView.swift
//  FaiflyTest
//
//  Created by Сергій on 22.03.2025.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    init() {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        }
    var body: some View {
        UserApp()
    }
}

#Preview {
    ContentView()
}
