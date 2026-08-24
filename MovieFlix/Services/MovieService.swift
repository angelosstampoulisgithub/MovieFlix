//
//  MovieService.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchPopular() async throws -> [Movie]
}

final class MovieService: MovieServiceProtocol {
    private let apiKey = "02bfa4c78ae850392758a84369d9e19c"

    func fetchPopular() async throws -> [Movie] {
        let url = URL(string:
            "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        )!

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MovieResponse.self, from: data)
        return response.results
    }
}
