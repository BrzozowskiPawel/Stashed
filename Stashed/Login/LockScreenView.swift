//
//  LockScreenView.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 06/06/2023.
//

import SwiftUI

struct LockScreenView: View {
    @State private var userPin: String = ""
    @State private var pin: String = "1234"
    @State private var isPinWrong: Bool = false
    private let animationDuration: Double = 1.5
    var body: some View {
        VStack {
            VStack {
                Text("Enter Passcode")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(
                        isPinWrong
                        ? .red
                        : .black
                    )
                
                Text("You have entered wrong PIN.")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(
                        isPinWrong
                        ? .red
                        : .white
                    )
            }
            .shake(
                $isPinWrong,
                duration: animationDuration
            )
            
            
            
            Spacer()
                .frame(height: 40)
            
            HStack {
                ForEach(0..<4) { index in
                    Circle()
                        .foregroundColor(getColorForCircle(index)
                        )
                        .frame(width: 40, height: 40)
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 20
                            )
                            .stroke(
                                Color.black,
                                lineWidth: 1)
                        )
                        .padding(.horizontal, 8)
                }
            }
            .padding(.bottom, 40)
            
            PinPadView(userPin: $userPin)
        }
        .padding()
        .onChange(of: userPin) { newValue in
            if userPin.count == pin.count {
                if userPin == pin {
                    HapticManager.shared.notify(.success)
                    SharedDataManager.shared.appStage = .home
                } else {
                    HapticManager.shared.notify(.error)
                    isPinWrong = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        isPinWrong = false
                        userPin = ""
                    }
                }
            }
        }
    }
    
    private func getColorForCircle(_ index: Int) -> Color {
        if index + 1 <= userPin.count {
            return .black
        } else {
            return .white
        }
    }
}

struct LockScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenView()
    }
}


struct Shake<Content: View>: View {
    /// Set to true in order to animate
    @Binding var shake: Bool
    /// How many times the content will animate back and forth
    var repeatCount = 3
    /// Duration in seconds
    var duration = 0.8
    /// Range in pixels to go back and forth
    var offsetRange = 10.0
    
    @ViewBuilder let content: Content
    var onCompletion: (() -> Void)?
    
    @State private var xOffset = 0.0
    
    var body: some View {
        content
            .offset(x: xOffset)
            .onChange(of: shake) { shouldShake in
                guard shouldShake else { return }
                Task {
                    let start = Date()
                    await animate()
                    let end = Date()
                    print(end.timeIntervalSince1970 - start.timeIntervalSince1970)
                    shake = false
                    onCompletion?()
                }
            }
    }
    
    // Obs: some of factors must be 1.0.
    private func animate() async {
        let factor1 = 0.9
        let eachDuration = duration * factor1 / CGFloat(repeatCount)
        for _ in 0..<repeatCount {
            await backAndForthAnimation(duration: eachDuration, offset: offsetRange)
        }
        
        let factor2 = 0.1
        await animate(duration: duration * factor2) {
            xOffset = 0.0
        }
    }
    
    private func backAndForthAnimation(duration: CGFloat, offset: CGFloat) async {
        let halfDuration = duration / 2
        await animate(duration: halfDuration) {
            self.xOffset = offset
        }
        
        await animate(duration: halfDuration) {
            self.xOffset = -offset
        }
    }
}

extension View {
    func shake(_ shake: Binding<Bool>,
               repeatCount: Int = 4,
               duration: CGFloat = 1.5,
               offsetRange: CGFloat = 10,
               onCompletion: (() -> Void)? = nil) -> some View {
        Shake(shake: shake,
              repeatCount: repeatCount,
              duration: duration,
              offsetRange: offsetRange) {
            self
        } onCompletion: {
            onCompletion?()
        }
    }
    
    func animate(duration: CGFloat, _ execute: @escaping () -> Void) async {
        await withCheckedContinuation { continuation in
            withAnimation(.linear(duration: duration)) {
                execute()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                continuation.resume()
            }
        }
    }
}
