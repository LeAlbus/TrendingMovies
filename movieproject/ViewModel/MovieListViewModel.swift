//
//  MovieListViewModel.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation

protocol MovieListViewModelDelegate: AnyObject {
    func didSelectMovie(_ movie: Movie)
}

class MovieListViewModel {
    
    weak var delegate: MovieListViewModelDelegate?
    
    private var movies: [Movie] = []
    var reloadData: (() -> Void)?

    init() {
        //TODO: - Fetch movie list
        self.fetchMovies {
            print("FETCH MOVIES")
        }
    }
    
    func fetchMovies(completion: @escaping () -> Void) {
        NetworkServices.shared.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Failed to fetch movies:", error)
                //TODO: Handle error
                DispatchQueue.main.async {
                    completion()
                }
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
