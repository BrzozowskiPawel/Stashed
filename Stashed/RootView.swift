//
//  RootView.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 04/06/2023.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var shared = SharedDataManager.shared
    let viewFactory: ViewFactory
    
    var body: some View {
        switch shared.appStage {
        case .onboarding:
            OnboardingView()
        case .login:
            LockScreenView()
        case .home:
            viewFactory.buildHomeCordinatingView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewFactory: ViewFactory())
    }
}
