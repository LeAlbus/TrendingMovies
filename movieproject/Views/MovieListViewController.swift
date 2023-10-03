//
//  MovieListViewController.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieListViewModel!
    weak var coordinator: MovieListCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "MovieCell")

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension

        // TODO: Replace mock with request
        viewModel.fetchMovies { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movieViewModel = viewModel.viewModelForMovie(at: indexPath.row)
        cell.viewModel = movieViewModel
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movieAtIndex(indexPath.row)
        let detailsVC = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        detailsVC.movie = movie
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
