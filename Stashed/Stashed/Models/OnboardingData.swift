//
//  OnboardingData.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 05/06/2023.
//

import Foundation
import SwiftUI

struct OnboardingData: Identifiable {
    let id: String = UUID().uuidString 
    let image: Image
    let title: String
    let message: String
}
