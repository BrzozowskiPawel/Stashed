//
//  HomeInteractor.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 14/06/2023.
//

import Foundation

protocol HomeInteracting {
//    func functionA()
}

final class HomeInteractor: HomeInteracting {
    private let coordinator: HomeCoordinator
    
    init(
        coordinator: HomeCoordinator
    ) {
        self.coordinator = coordinator
    }

}
