//
//  CustomLabel.swift
//  ArmFit
//
//  Created by Davit Muradyan on 05.08.25.
//

import SwiftUI

extension View {
    func getCustomLabel(imageName: String, facName: String) -> some View {
        Capsule()
            .fill(Color(.systemBackground))
            .frame(height: 50)
            .overlay {
                HStack(spacing: 0) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .padding(.vertical)
                        .padding(.leading)
                    Text(facName)
                        .font(.body)
                        .minimumScaleFactor(0.7)
                        .multilineTextAlignment(.leading)
                        .padding()
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .shadow(color: Color.black.opacity(0.3), radius: 2)
    }
}
