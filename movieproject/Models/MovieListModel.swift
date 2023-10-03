//
//  MovieListModel.swift
//  movieproject
//
//  Created by Pedro Lopes on 03/10/23.
//

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalResults: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
