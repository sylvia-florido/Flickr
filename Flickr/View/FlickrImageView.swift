//
//  DownloadableImageView.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import SwiftUI

struct FlickrImageView: View {
    @StateObject var viewModel = FlickrFetcher()
    @State var data: Data?
    let flickrImage: FlickrImage
    var size: CGSize = CGSize(width: 100, height: 100)
    
    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
                .background(Color.gray)
        } else {
            Image(systemName: "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
                .background(Color.gray)
                .onAppear {
                    fetchImage()
                }
        }
    }
    
    private func fetchImage() {
        guard let url = URL(string: flickrImage.imageUrl) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        
        task.resume()
    }
}


#Preview {
    FlickrImageView(flickrImage: FlickrImage.exampleImage())
}
