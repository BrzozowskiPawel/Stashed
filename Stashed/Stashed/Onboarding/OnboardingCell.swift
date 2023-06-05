//
//  OnboardingCell.swift
//  Stashed
//
//  Created by Paweł Brzozowski on 05/06/2023.
//

import SwiftUI

struct OnboardingCell: View {
    let icon: Image
    let title: String
    let message: String
    
    var body: some View {
        HStack {
            icon
                .font(.system(size: 54))
                .foregroundColor(.indigo)
                .frame(width: 70, height: 60)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(.title3,design: .rounded, weight: .bold))
                Text(message)
                    .font(.system(.body, design: .rounded))
            }
        }
    }
}

struct OnboardingCell_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCell(
            icon: Image(systemName: "lock"),
            title: "Secure Data",
            message: "Stashed is not collecting any data. \nIt's only stored localy.")
    }
}
