//
//  SharedDataManager.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 04/06/2023.
//

import Foundation

class SharedDataManager: ObservableObject {
    static let shared = SharedDataManager()
    
    @Published var appStage: AppStage
    
    
    private init() {
        appStage = .onboarding
    }
}

enum AppStage {
    case onboarding
    case login
    case home
}
