//
//  EmptyState.swift
//  Appetizers
//
//  Created by Max Roberts on 1/2/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image("\(imageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text("\(message)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .offset(y: -50.0)
            
            
            .navigationTitle("🧾 Orders")
        }
    }
        
}

#Preview {
    EmptyState(imageName: "food-placerholder", message: "This is our test message. I'm making it longer for testing purposes.")
}
