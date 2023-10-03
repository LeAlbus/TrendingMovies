//
//  MovieDetailsViewModel.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    
    private var movie: Movie

    var title: String {
        return movie.title
    }
    
    var posterURL: String {
        return movie.posterURL
    }

    var backdropURL: String {
        return movie.backdropURL
    }
    
    var description: String {
        return movie.description
    }

    init(movie: Movie) {
        self.movie = movie
    }
    
    func retrieveMoviePoster(completion: @escaping (UIImage?) -> Void) {
        
        if let fullURL = URL(string: APIConstants.posterURL(posterURL, size: .full)){
            NetworkServices.shared.fetchImage(from: fullURL) { image in
                completion(image)
            }
        }
    }
    
    func retrieveBackdrop(completion: @escaping (UIImage?) -> Void) {
        
        if let fullURL = URL(string: APIConstants.backdropURL(backdropURL)) {
            NetworkServices.shared.fetchImage(from: fullURL) { image in
                completion(image)
            }
        }
    }
}
