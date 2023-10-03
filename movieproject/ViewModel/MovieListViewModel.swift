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
    var paging: Int = 1
    private var movies: [Movie] = []
    var isLoading: Bool = false
    //var reloadData: (() -> Void)?
    
    private var networkService: NetworkServicesProtocol
    
    init(networkService: NetworkServicesProtocol = NetworkServices.shared) {
        self.networkService = networkService
    }
      
    
    func fetchMovies(completion: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        
        guard !isLoading else { return }
        isLoading = true
        
        self.networkService.fetchMovies(page: self.paging) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let movies):
                self?.movies.append(contentsOf: movies)
                self?.paging += 1
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Failed to fetch movies:", error)
                self?.paging = 1
                DispatchQueue.main.async {
                    errorHandler()
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
