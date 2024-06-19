//
//  APIMockService.swift
//  FlickrTests
//
//  Created by Silvia Florido on 19/06/24.
//

import Foundation
@testable import Flickr

class APIMockService: FlickrServiceProtocol {
    func fetchFlickrImageList(by tag: String, completion: @escaping (Result<Flickr.FlickrImagesList, Flickr.FlickrError>) -> Void) {
        completion(.success(FlickrImagesList.exampleList()))
    }
}
