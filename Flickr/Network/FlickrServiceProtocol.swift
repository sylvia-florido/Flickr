//
//  FlickrServiceProto.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import Foundation

protocol FlickrServiceProtocol {
    func fetchFlickrImageList(by tag: String, completion: @escaping (Result<FlickrImagesList, FlickrError>) -> Void)
}
