//
//  ViewManager.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 04/06/2023.
//

import SwiftUI

struct ViewManager: View {
    @ObservedObject var shared = SharedDataManager.shared
    
    var body: some View {
        switch shared.appStage {
        case .onboarding:
            Button {
                shared.appStage = .login
            } label: {
                Text("Onboarding -> Login")
            }
        case .login:
            Button {
                shared.appStage = .home
            } label: {
                Text("Login -> Home")
            }
        case .home:
            Text("Home")
        }
    }
}

struct ViewManager_Previews: PreviewProvider {
    static var previews: some View {
        ViewManager()
    }
}
