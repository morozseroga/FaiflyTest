//
//  UserRow.swift
//  FaiflyTest
//
//  Created by Сергій on 23.03.2025.
//

import SwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(user.fullName)
                    .font(.headline)
                Text(user.email)
            }
        }
    }
}

#Preview {
    UserRow(user: User(id: 1,
                       email: "mail@mail.com",
                       first_name: "First",
                       last_name: "Last",
                       avatar: "https://reqres.in/img/faces/7-image.jpg"))
}
