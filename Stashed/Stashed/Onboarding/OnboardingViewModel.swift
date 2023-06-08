//
//  OnboardingViewModel.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 05/06/2023.
//

import Foundation
import SwiftUI

enum OnboardingStage {
    case first
    case second
}

class OnboardingViewModel: ObservableObject {
    @Published var startAnimating = false
    @Published var onboardingStage: OnboardingStage = .first
    @Published var animateNext = false
    
    var onboardingData: [OnboardingData] = [OnboardingData]()
    
    init() {
        setOnboardingData()
    }
    
    private func setOnboardingData() {
        self.onboardingData = [
            OnboardingData(
                image: Image(systemName: "lock"),
                title: "Your data is scure",
                message: "Stashed is not collecting any data. \nIt's only stored localy."),
            OnboardingData(
                image: Image(systemName: "chart.xyaxis.line"),
                title: "Keep track of your balance",
                message: "Data is being refreshed and saved \n. It will stay eaven when you close the app."),
            OnboardingData(
                image: Image(systemName: "dollarsign.circle"),
                title: "It's completly free",
                message: "Don't worry you can use it without any costs.")
        ]
    }
}
