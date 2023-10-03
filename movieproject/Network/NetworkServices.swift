//
//  NetworkServices.swift
//  movieproject
//
//  Created by Pedro Lopes on 03/10/23.
//

import Foundation
import Alamofire
import AlamofireImage

class NetworkServices {
    
    static let shared = NetworkServices()

    private init() {}
    
    func fetchMovies(page: Int = 1, completion: @escaping (Result<[Movie], AFError>) -> Void) {
        
        let params: [String: Any] = [
            "include_adult": false,
            "include_video": false,
            "language": "en-US",
            "page": page,
            "sort_by": "popularity.desc"
        ]
        
        let url = APIConstants.baseURL + APIConstants.movieListEndpoint
        let headers = HTTPHeaders(APIConstants.headers)
        
        AF.request(url, parameters: params, headers: headers)
          .validate()
          .responseDecodable(of: MoviesResponse.self) { response in
              switch response.result {
              case .success(let movieList):
                  completion(.success(movieList.results))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
    }
    
    func fetchPosterImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        AF.request(url).responseImage { response in
            switch response.result {
            case .success(let image):
                completion(image)
            case .failure(_):
                completion(nil)
            }
        }
    }

}
