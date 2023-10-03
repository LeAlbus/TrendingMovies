//
//  MovieTableViewCell.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import Foundation
import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    var viewModel: MovieCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            titleLabel.text = viewModel.title
            if let year = viewModel.year.split(separator: "-").first {
                yearLabel.text = String(year)
            }
            movieImageView.image = UIImage(named: "PosterPlaceholder")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
