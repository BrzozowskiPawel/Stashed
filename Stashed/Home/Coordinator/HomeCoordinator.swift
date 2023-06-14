//
//  HomeCoordinator.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 14/06/2023.
//

import SwiftUI

enum HomeDestination: DestinationEnum {
    case homeView
    
    var id: UUID {
        UUID()
    }
}

enum HomeSheet: DestinationEnum {
    case sheet
    
    var id: UUID {
        UUID()
    }
}

enum HomeFullScreenCover: DestinationEnum {
    case first
    
    var id: UUID {
        UUID()
    }
}

class HomeCoordinator: Coordinating {
    typealias PushDestination = HomeDestination
    typealias SheetDestination = HomeSheet
    typealias FullScreenCoverDestination = HomeFullScreenCover
    
    @Published var path = NavigationPath()
    @Published var presentingSheet: HomeSheet?
    @Published var presentingFullScreenCover: HomeFullScreenCover?
    
    private let viewFactory: ViewFactory
    
    init(
        viewFactory: ViewFactory
    ) {
        self.viewFactory = viewFactory
    }
    
    @ViewBuilder func build(destination: HomeDestination) -> some View {
        switch destination {
        case .homeView:
            viewFactory.buildHomeView(coordinator: self)
        }
    }
    
    @ViewBuilder func build(sheet: HomeSheet) -> some View {
        switch sheet {
        case .sheet:
            Text("Login Coordinator Sheet")
        }
    }
    
    @ViewBuilder func build(fullScreenCover: FullScreenCoverDestination) -> some View {
        switch fullScreenCover {
        case .first:
            Text("Login Coordinator FullScreen Sheet")
        }
    }
}
