//
//  UserApp.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import SwiftUI

struct UserApp: View {
    var body: some View {
        TabView {
            UsersListView()
                .tabItem {
                    Label("Всі", systemImage: "person.3")
                }
            
            FavoritesListView()
                .tabItem {
                    Label("Улюблені", systemImage: "heart.fill")
                }
        }
        .environmentObject(FavoritesViewModel())
    }
}

#Preview {
    UserApp()
}
