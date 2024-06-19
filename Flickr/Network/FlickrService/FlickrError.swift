//
//  FlickrAPIError.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import Foundation

enum FlickrError: Error {
    case invalidTag
    case notFound
    case networkError
    
    init(apiError: APIError) {
        self = .networkError
    }
    
    var localizedDescription: String {
        switch self {
        case .invalidTag:
            "Invalid search terms."
        case .notFound:
            "No results found for this search."
        case .networkError:
            "Sorry, something went wrong."
        }
    }
}
