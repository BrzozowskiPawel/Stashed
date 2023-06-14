//
//  StashedApp.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 04/06/2023.
//

import SwiftUI

@main
struct StashedApp: App {
    private let viewFactory = ViewFactory()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                viewFactory.buildRootView()
            }
        }
    }
}
