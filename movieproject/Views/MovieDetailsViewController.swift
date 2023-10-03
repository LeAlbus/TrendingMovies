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
    
    var viewModel: MovieDetailsViewModel!
    weak var coordinator: MovieDetailCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        titleLabel.text = viewModel.title
        overviewLabel.text = viewModel.description
        viewModel.retrieveMoviePoster { [weak self] image in
            DispatchQueue.main.async {
                self?.posterImageView.image = image ?? UIImage(named: "PosterPlaceholder")
            }
        }
    }
}

