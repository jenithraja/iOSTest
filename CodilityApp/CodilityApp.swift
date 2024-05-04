//
//  CodilityAppApp.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/1/24.
//

import SwiftUI

@main
struct CodilityApp: App {
    @StateObject var usersVM = UsersVM()

    var body: some Scene {
        WindowGroup {
            UsersView()
                .environmentObject(usersVM)
        }
    }
}
