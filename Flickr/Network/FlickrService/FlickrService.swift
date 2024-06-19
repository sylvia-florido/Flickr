//
//  FlickrService.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import Foundation

class FlickrService: FlickrServiceProtocol {
    static let shared = FlickrService()
    let apiService = APIService.shared
    let baseUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
    
    private init() {}
    
    func fetchFlickrImageList(by tag: String, completion: @escaping (Result<FlickrImagesList, FlickrError>) -> Void) {
        let urlString = "\(baseUrl)&tags=\(tag)"
        
        if tag.isEmpty {
            completion(.failure(FlickrError.invalidTag))
        }
        
        apiService.getData(urlString: urlString, responseType: FlickrImagesList.self) { result in
            switch result {
            case .success(let result):
                if result.items.count == 0 {
                    completion(.failure(FlickrError.notFound))
                } else {
                    completion(.success(result))
                }
            case .failure(let error):
                let flickrError = FlickrError(apiError: error)
                completion(.failure(flickrError))
            }
        }
    }
    
    func fetchImage(with urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        apiService.getData(urlString: urlString, responseType: Data.self) { result in
            switch result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
