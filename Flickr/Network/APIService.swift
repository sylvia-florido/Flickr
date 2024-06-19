//
//  APIService.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func getData<T: Decodable>(urlString: String, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidUrl))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as? URLError {
                completion(.failure(.urlError(error: error)))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
                    
             guard 200...299 ~= response.statusCode else {
                 completion(.failure(.invalidResponse(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
                        
            do {
                let results = try JSONDecoder().decode(responseType.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(.parsing))
            }
        }
        task.resume()
    }
}
