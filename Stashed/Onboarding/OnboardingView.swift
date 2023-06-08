//
//  OnboardingView.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 05/06/2023.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        switch viewModel.onboardingStage {
        case .first:
            VStack {
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Image(systemName: "building.columns.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(16)
                            .padding(.bottom, 10)
                        
                        Text("Welcome to")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                        Text("Stashed App")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                            .foregroundColor(.indigo)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                .opacity(viewModel.startAnimating ? 1.0 : 0.0)
                .scaleEffect(viewModel.startAnimating ? 1.0 : 0.8)
                
                Spacer()
                
                Button {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.6)) {
                        viewModel.onboardingStage = .second
                    }
                } label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background {
                            Color.indigo
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                }

            }
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.6)) {
                    viewModel.startAnimating = true
                }
            }
        case .second:
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome to")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                        Text("Stashed")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                            .foregroundColor(.indigo)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 48)
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.onboardingData) { data in
                        OnboardingCell(
                            icon: data.image ,
                            title: data.title,
                            message: data.message)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top)
                
                Spacer()
                
                Button {
                    withAnimation {
                        SharedDataManager.shared.appStage = .login
                    }
                } label: {
                    Text("LETS GET STARTED")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background {
                            Color.indigo
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                .offset(y: viewModel.animateNext ? 0 : 40)
            }
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.6)) {
                    viewModel.animateNext = true
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
