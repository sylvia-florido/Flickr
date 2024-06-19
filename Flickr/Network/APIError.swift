//
//  APIError.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case urlError(error: URLError)
    case invalidResponse(statusCode: Int)
    case invalidData
    case parsing
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .urlError, .invalidResponse:
            "Sorry, something went wrong with our server. Please try later."
        default:
            "Sorry, something went wrong."
        }
    }
}
