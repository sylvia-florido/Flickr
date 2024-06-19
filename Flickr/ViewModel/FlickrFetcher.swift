//
//  FlickrFetcher.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import Foundation

class FlickrFetcher: ObservableObject {
    @Published var images: [FlickrImage] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    let service: FlickrServiceProtocol
    
    init(service: FlickrServiceProtocol = FlickrService.shared) {
        self.service = service
    }
    
    func fetchFlickrImages(by tags: String) {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = true
            self?.errorMessage = nil
        }
        service.fetchFlickrImageList(by: tags) { result in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                switch result {
                case .success(let imagesList):
                    self?.images = imagesList.items
                case .failure(let error):
                    self?.images = []
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func clear() {
        self.images = []
    }
    
    // MARK: - Preview helpers
    static func errorState() -> FlickrFetcher {
        let fetcher = FlickrFetcher()
        fetcher.errorMessage = FlickrError.networkError.localizedDescription
        return fetcher
    }
    
    static func successState() -> FlickrFetcher {
        let fetcher = FlickrFetcher()
        fetcher.images = [FlickrImage.exampleImage(),FlickrImage.exampleImage(),FlickrImage.exampleImage(),FlickrImage.exampleImage(),FlickrImage.exampleImage(),FlickrImage.exampleImage()]
        return fetcher
    }
}


