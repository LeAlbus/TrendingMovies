//
//  MovieListViewModel.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation

class MovieListViewModel {
    
    private var movies: [Movie] = []
    var reloadData: (() -> Void)?

    init() {
        //TODO: - Fetch movie list
        self.fetchMovies {
            print("FETCH MOVIES")
        }
    }
    
    func fetchMovies(completion: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.movies = [ // Mock data
                Movie(id: 1, title: "Movie 1", year: "2020", description: "TEST DESCRIPTION", posterURL: URL(string: "https://example.com/movie1.jpg")!),
                Movie(id: 2, title: "Movie 2", year: "2021", description: "TEST DESCRIPTION", posterURL: URL(string: "https://example.com/movie2.jpg")!),
                Movie(id: 3, title: "Movie 3", year: "2019", description: "TEST DESCRIPTION", posterURL: URL(string: "https://example.com/movie3.jpg")!)
            ]
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movieAtIndex(_ index: Int) -> Movie {
        return movies[index]
    }
    
    func viewModelForMovie(at index: Int) -> MovieCellViewModel {
        return MovieCellViewModel(movie: movies[index])
    }
}
