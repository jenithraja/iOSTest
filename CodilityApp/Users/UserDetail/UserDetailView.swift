//
//  UserDetailView.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/4/24.
//

import SwiftUI

struct UserDetailView: View {
    var usersModel: UsersModel
    var body: some View {
                ZoomableScrollView {
                    ProfileImageView(urlString: usersModel.avatarURL ?? "")
                        .aspectRatio(contentMode: .fit)
                }
//            .navigationTitle(usersModel.login ?? "Back")
//            .navigationBarTitle("Detail View", displayMode: .inline)
        }
    }


