//
//  Constants.swift
//  movieproject
//
//  Created by Pedro Lopes on 03/10/23.
//

struct APIConstants {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let movieListEndpoint = "discover/movie"

    static let headers: [String: String] = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMDJhNTAxYzQ2MmY2ZDZmZGI4ZDliMjE2MGNmOTI0MyIsInN1YiI6IjVhOWIwODI4OTI1MTQxMjhiZTAyMzcxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TpvJGfG09Zf9HBpdC5a-AWQUXv2_0r7sKuEkUetp45k"
    ]
    
    static func movieEndpoint(for movieID: String) -> String {
        return "movie/\(movieID)"
    }
}

struct StringConstants {
    static let genericErrorMessgae = "Something went wrong,\nplease try again"
}
