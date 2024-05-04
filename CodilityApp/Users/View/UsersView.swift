//
//  ContentView.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/1/24.
//

import SwiftUI

struct UsersView: View {
    @StateObject var usersVM = UsersVM()

    var body: some View {
        ZStack {
            
            NavigationView {
                List {
                    ForEach(usersVM.usersModel, id: \.id) { item in
                        HStack{
                            ProfileImageView(urlString: item.avatarURL ?? "")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                            Text(item.login ?? "")
                        }
                    }
                }
                .navigationTitle("User List")
            }
            .onAppear {
                usersVM.getUsersList()
            }
            
            if usersVM.isLoading { LoadingView() }
        }
        
        .alert(item: $usersVM.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("avatar").resizable()
    }
}


struct ProfileImageView: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURL: urlString) }
    }
}


struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
