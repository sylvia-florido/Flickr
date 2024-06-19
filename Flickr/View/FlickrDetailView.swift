//
//  FlickrDetailView.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import SwiftUI

struct FlickrDetailView: View {
    let flickrImage: FlickrImage
    
    var body: some View {
        VStack(spacing: 20) {
            FlickrImageView(flickrImage: flickrImage, size: CGSize(width: 300, height: 200))
            Text(flickrImage.title).bold()
            Text(flickrImage.author ?? "")
            Text(flickrImage.description?.htmlToString() ?? "")
            Text(flickrImage.published?.utcTimeToString() ?? "")
        }
        .padding(40)
    }
}

#Preview {
    FlickrDetailView(flickrImage: FlickrImage.exampleImage())
}
