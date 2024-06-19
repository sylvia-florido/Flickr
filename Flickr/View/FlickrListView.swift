//
//  FlickrListView.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import SwiftUI

struct FlickrListView: View {
    var images: [FlickrImage] = []
    
    var body: some View {
        List {
            ForEach(images, id: \.self) { image in
                HStack {
                    NavigationLink {
                        FlickrDetailView(flickrImage: image)
                    } label: {
                        FlickrImageView(flickrImage: image)
                        Text(image.title)
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    FlickrListView(images: FlickrFetcher.successState().images)
}
