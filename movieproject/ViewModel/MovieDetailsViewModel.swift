//
//  MovieDetailsViewModel.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation

class MovieDetailsViewModel {
    
    private var movie: Movie

    var title: String {
        return movie.title
    }

    var year: String {
        return movie.year
    }
    
    var posterURL: URL {
        return movie.posterURL
    }

    var description: String {
        return movie.description
    }

    init(movie: Movie) {
        self.movie = movie
    }
}
