//  HomeView.swift
//  Store
//
//  Created by Denys Nalbat on 15.08.2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text(User.description)
    }
}

struct HomeView_Previous: PreviewProvider {
    static var previous: some View {
        HomeView()
    }
}