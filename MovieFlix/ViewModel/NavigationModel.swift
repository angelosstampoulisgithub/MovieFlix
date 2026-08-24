//
//  NavigationModel.swift
//  MovieFlix
//
//  Created by Angelos Staboulis on 24/8/26.
//

import Foundation
import SwiftUI

final class NavigationModel: ObservableObject {
    @Published var path = NavigationPath()

    func openMovie(_ movie: Movie) {
        path.append(movie)
    }
}
