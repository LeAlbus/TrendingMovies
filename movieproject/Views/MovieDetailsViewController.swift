//
//  MovieDetailsViewController.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var fadeView: UIView!
    var viewModel: MovieDetailsViewModel!
    
    weak var coordinator: MovieDetailCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupImages()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       // setupViews()
    }
        
    private func setupImages() {
        viewModel.retrieveMoviePoster { [weak self] image in
            DispatchQueue.main.async {
                self?.posterImageView.image = image ?? UIImage(named: "PosterPlaceholder")
            }
        }
        viewModel.retrieveBackdrop { [weak self] image in
            DispatchQueue.main.async {
                if let image = image {
                    self?.backdropImageView.image = image
                }
            }
        }
    }
    
    private func setupViews() {
        edgesForExtendedLayout = []
        titleLabel.text = viewModel.title
        overviewLabel.text = viewModel.description
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = fadeView.bounds
        fadeView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

