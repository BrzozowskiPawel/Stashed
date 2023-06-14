//
//  HapticManager.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 08/06/2023.
//

import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    private init() { }

    func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
    
    func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
}
