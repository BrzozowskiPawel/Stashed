//
//  PinPadView.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 08/06/2023.
//

import SwiftUI

struct PinPadView: View {
    @Binding var userPin: String
    private let digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 20) {
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(digits, id: \.self) { digit in
                    Button(action: {
                        self.userPin.append(digit)
                    }) {
                        Text(digit)
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .frame(width: 80, height: 80)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(40)
                    }
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    self.userPin.append("0")
                }) {
                    Text("0")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(40)
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct PinPadView_Previews: PreviewProvider {
    static var previews: some View {
        PinPadView(userPin: .constant(""))
    }
}
