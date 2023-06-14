//
//  HomeViewCoordinator.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 14/06/2023.
//

import SwiftUI

struct HomeViewCoordinator: View {
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(destination: .homeView)
                .navigationDestination(for: HomeDestination.self) {
                    coordinator.build(destination: $0)
                }
                .sheet(item: $coordinator.presentingSheet) {
                    coordinator.build(sheet: $0)
                }
                .fullScreenCover(item: $coordinator.presentingFullScreenCover) {
                    coordinator.build(fullScreenCover: $0)
                }
        }
    }
}
