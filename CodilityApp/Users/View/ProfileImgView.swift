//
//  ProfileImage.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/4/24.
//

import SwiftUI

struct ProfileImageView: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURL: urlString) }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("avatar").resizable()
    }
}
