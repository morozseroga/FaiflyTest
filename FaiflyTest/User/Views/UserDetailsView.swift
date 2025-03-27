//
//  UserDetailView.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    let supportText: String?
    @EnvironmentObject private var viewModel: FavoritesViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text(user.fullName)
                .font(.title)
            
            Text(user.email)
                .foregroundColor(.secondary)
            
            if let text = supportText {
                Text(text)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                viewModel.toggleFavorite(user)
            }) {
                let isFavorite = viewModel.isFavorite
                Label(isFavorite ? "Видалити з улюблених" : "Додати до улюблених", systemImage: "heart.fill")
                    .padding()
                    .background(isFavorite ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Деталі")
    }
}
