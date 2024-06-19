//
//  ContentView.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FlickrFetcher()
    @State var searchTerm = ""

    var body: some View {
        NavigationView {
            ZStack {
                FlickrListView(images: viewModel.images)
                
                if viewModel.isLoading {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(errorMessage: errorMessage)
                }
            }
        }
        .navigationTitle("Flickr Images")
        .searchable(text: $searchTerm, placement: .automatic, prompt: "Search images")
        .onChange(of: searchTerm) {
            fetchImages()
        }
    }
    
    private func fetchImages() {
        guard !searchTerm.isEmpty else {
            viewModel.clear()
            return
        }
        viewModel.fetchFlickrImages(by: searchTerm)
    }
}

#Preview {
    ContentView()
}
