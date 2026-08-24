//
//  ContentView.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var nav = NavigationModel()
    var body: some View {
        NavigationStack(path: $nav.path) {
                   MovieListView()
                       .environmentObject(nav)
                       .navigationDestination(for: Movie.self) { movie in
                           MovieDetailView(movie: movie)
                       }
               }
    }
}

#Preview {
    ContentView()
}
