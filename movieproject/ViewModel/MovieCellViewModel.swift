//
//  MovieCellViewModell.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieCellViewModel {

    let title: String
    let year: String
    let posterURL: String

    init(movie: Movie) {
        self.title = movie.title
        self.year = movie.year
        self.posterURL = movie.posterURL
    }
    
    func retrieveMoviePoster(completion: @escaping (UIImage?) -> Void) {
        
        if let fullURL = URL(string: APIConstants.posterURL(posterURL, size: .small)){
            NetworkServices.shared.fetchImage(from: fullURL) { image in
                completion(image)
            }
        }
    }
}
