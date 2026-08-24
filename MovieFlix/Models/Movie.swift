//
//  Movie.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import Foundation

struct Movie: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String

    var posterURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")!
    }
}
