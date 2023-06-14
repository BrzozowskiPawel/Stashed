//
//  ViewFactory.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 14/06/2023.
//

import SwiftUI

final class ViewFactory {
    @ViewBuilder func buildRootView() -> some View {
        RootView(viewFactory: self)
    }
    
    // HomeView
    @ViewBuilder func buildHomeCordinatingView() -> some View {
        let coordinator = HomeCoordinator(viewFactory: self)
        HomeViewCoordinator(coordinator: coordinator)
    }
    
    @ViewBuilder func buildHomeView(coordinator: HomeCoordinator) -> some View {
        let viewModel = HomeViewModel()
        let interactor = HomeInteractor(coordinator: coordinator)
        HomeView(
            viewModel: viewModel,
            interactor: interactor)
    }
}
