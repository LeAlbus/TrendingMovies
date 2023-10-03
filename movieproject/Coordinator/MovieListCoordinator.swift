//
//  MovieListCoordinator.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MovieListCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let moviesViewController = MovieListViewController()
        moviesViewController.coordinator = self
        moviesViewController.viewModel = MovieListViewModel()
        navigationController.pushViewController(moviesViewController, animated: false)
    }
    
    func showMovieDetail(for movie: Movie) {
        let detailCoordinator = MovieDetailCoordinator(movie: movie, navigationController: navigationController)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}
