//
//  MovieModel.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let year: String
    let description: String
    let posterURL: String
    let backdropURL: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title = "original_title"
        case year = "release_date"
        case description = "overview"
        case posterURL = "poster_path"
        case backdropURL = "backdrop_path"
    }
}



