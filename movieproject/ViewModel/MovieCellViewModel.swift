//
//  MovieCellViewModell.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation

class MovieCellViewModel {

    let title: String
    let year: String
    let posterURL: URL

    init(movie: Movie) {
        self.title = movie.title
        self.year = movie.year
        self.posterURL = movie.posterURL
    }
}
