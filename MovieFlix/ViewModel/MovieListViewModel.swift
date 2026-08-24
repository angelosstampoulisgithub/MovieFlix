//
//  MovieListViewModel.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import Foundation
import SwiftUI

@MainActor
final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false

    private let service: MovieServiceProtocol

    init(service: MovieServiceProtocol = MovieService()) {
        self.service = service
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            movies = try await service.fetchPopular()
        } catch {
            print("Error loading movies:", error)
        }
    }
}
