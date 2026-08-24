//
//  MovieListView.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import Foundation
import SwiftUI

struct MovieListView: View {
    @StateObject private var vm = MovieListViewModel()
    @EnvironmentObject var nav: NavigationModel

    var body: some View {
        List(vm.movies) { movie in
            Button {
                nav.openMovie(movie)
            } label: {
                HStack {
                    AsyncImage(url: movie.posterURL) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 120)
                    .cornerRadius(8)

                    Text(movie.title)
                        .font(.headline)
                }
            }
        }
        .task { await vm.load() }
        .navigationTitle("Popular Movies")
    }
}
