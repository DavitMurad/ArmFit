//
//  Testasd.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI

struct Testasd: View {
    var body: some View {
        VStack(spacing: 25) {
            Capsule()
                .fill(.white)
                .frame(width: 200, height: 50)
                .overlay {
                    Label("Equipment", image: "gym-equipment")
                }
              
            
            Capsule()
                .fill(.white)
                .frame(width: 200, height: 50)
                .overlay {
                    HStack {
                        Image("gym-equipment")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .padding()
                        Text("Equipment")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                .shadow(radius: 10)
        }
      
        
    }
}

#Preview {
    Testasd()
}
