//
//  MovieDetailView.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                AsyncImage(url: movie.posterURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .scaledToFit()

                Text(movie.title)
                    .font(.largeTitle)
                    .bold()

                Text(movie.overview)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
