//
//  UsersVM.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/1/24.
//

import Foundation

final class UsersVM: ObservableObject{
    
    @Published var usersModel = [UsersModel]()
    @Published var isLoading = false
    @Published var alertItem: AlertItem?

    func getUsersList()
    {
        isLoading = true
        
        NetworkManager.shared.fetch(url: URL(string: "https://api.github.com/users")!) { data in
            return try! JSONDecoder().decode([UsersModel].self, from: data)
        }completion: { result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result{
            case .success(let facts):
                if let facts = facts{
                    DispatchQueue.main.async {
                        self.usersModel = facts
                    }
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
