//
//  HomeView.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 14/06/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    let interactor: HomeInteracting
    
    init(
        viewModel: HomeViewModel,
        interactor: HomeInteracting
    ) {
        self.viewModel = viewModel
        self.interactor = interactor
    }
    
    var body: some View {
        Text("Home View")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(),
            interactor: HomeInteractorMock())
    }
}

struct HomeInteractorMock: HomeInteracting {
    func logIn() {}
    func createAccount() {}
    func forgotPassword() {}
}
