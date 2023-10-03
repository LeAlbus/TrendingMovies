//
//  MovieDetailsViewController.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    // ViewModel for the movie details
    var viewModel: MovieDetailsViewModel!
    weak var coordinator: MovieDetailCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = viewModel.title
        yearLabel.text = viewModel.year
      
    }
}
