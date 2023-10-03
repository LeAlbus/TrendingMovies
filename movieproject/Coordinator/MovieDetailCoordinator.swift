//
//  MovieDetailCoordinator.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private var movie: Movie

    init(movie: Movie, navigationController: UINavigationController) {
        self.movie = movie
        self.navigationController = navigationController
    }

    func start() {
        let movieDetailVC = MovieDetailsViewController()
        let movieDetailViewModel = MovieDetailsViewModel(movie: movie)
        movieDetailVC.viewModel = movieDetailViewModel
        movieDetailVC.coordinator = self

        navigationController.pushViewController(movieDetailVC, animated: true)
    }
}
