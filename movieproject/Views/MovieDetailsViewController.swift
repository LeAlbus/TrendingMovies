//
//  MovieDetailsViewController.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    var viewModel: MovieDetailsViewModel!
    weak var coordinator: MovieDetailCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func setupViews() {
        titleLabel.text = movie.title
        overviewLabel.text = movie.description
        posterImageView.af.setImage(withURL: movie.posterURL)
    }
}

