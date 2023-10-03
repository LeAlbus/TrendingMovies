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
    
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var retryLabel: UILabel!
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

        self.viewModel.delegate = self      
        self.setErrorState(false)
        configureLoadingFooter()
        
        self.requestContent()
    }
    
    func requestContent() {
        viewModel.fetchMovies { [weak self] in
            self?.setErrorState(false)
            self?.tableView.reloadData()
        } errorHandler: {
            self.setErrorState(true)
        }
    }
    
    func configureLoadingFooter() {
        let footerView = LoadingFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        tableView.tableFooterView = footerView
    }
    
    func setErrorState(_ state: Bool) {
        
        self.retryLabel.text = StringConstants.genericErrorMessgae
        if state {
            self.retryLabel.isHidden = false
            self.retryButton.isHidden = false
            self.tableView.isHidden = true
        } else {
            self.retryLabel.isHidden = true
            self.retryButton.isHidden = true
            self.tableView.isHidden = false
        }
    }
    
    @IBAction func retryAction(_ sender: Any) {
        self.requestContent()
    }
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", 
                                                 for: indexPath) as! MovieTableViewCell
        let movieViewModel = viewModel.viewModelForMovie(at: indexPath.row)
        cell.viewModel = movieViewModel
        
        movieViewModel.retrieveMoviePoster { [weak cell] image in
            DispatchQueue.main.async {
                cell?.movieImageView.image = image ?? UIImage(named: "PosterPlaceholder")
            }
        }
        
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movieAtIndex(indexPath.row)
        viewModel.delegate?.didSelectMovie(movie)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfMovies() - 1 && !viewModel.isLoading {
            tableView.tableFooterView?.isHidden = false
            viewModel.fetchMovies {
                self.setErrorState(false)
                tableView.reloadData()
                if !self.viewModel.isLoading {
                    tableView.tableFooterView?.isHidden = true
                }
            } errorHandler: {
                self.setErrorState(true)
            }
        }
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func didSelectMovie(_ movie: Movie) {
        coordinator?.showMovieDetail(for: movie)
    }
}
 
