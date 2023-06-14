//
//  Coordinating.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 14/06/2023.
//

import SwiftUI

public protocol DestinationEnum: Hashable, Identifiable, CaseIterable { }

public protocol Coordinating: ObservableObject {
    associatedtype PushDestination: DestinationEnum
    associatedtype SheetDestination: DestinationEnum
    associatedtype FullScreenCoverDestination: DestinationEnum
    
    var path: NavigationPath { get set }
    var presentingSheet: SheetDestination? { get set }
    var presentingFullScreenCover: FullScreenCoverDestination? { get set }
}

extension Coordinating {
    func push(_ destination: PushDestination) {
        path.append(destination)
    }
    
    func present(sheet: SheetDestination) {
        presentingSheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCoverDestination) {
        presentingFullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        presentingSheet = nil
    }
    
    func dismissFullScreenCover() {
        presentingFullScreenCover = nil
    }
}

