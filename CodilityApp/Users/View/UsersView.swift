//
//  ContentView.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/1/24.
//

import SwiftUI

struct UsersView: View {
    @EnvironmentObject var usersVM: UsersVM
    var body: some View
    {
        ZStack {
            NavigationView {
                    List {
                        ForEach(usersVM.usersModel, id: \.id) { item in
                            UserCell(item: item)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .navigationTitle("User's List")
            }
            .onAppear { usersVM.getUsersList() }
            if usersVM.isLoading { LoadingView() }
        }
        .alert(item: $usersVM.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct UserCell: View{
    @State private var isShowingDetailView = false
    let item: UsersModel
    var body: some View{
        NavigationLink(destination: UserDetailView(usersModel: item), isActive: $isShowingDetailView) {
            HStack{
                ProfileImageView(urlString: item.avatarURL ?? "")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
                Text(item.login ?? "")
                Spacer()
            }
            .padding(.all,5)

        }
    }
}
