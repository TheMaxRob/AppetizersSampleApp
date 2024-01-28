//
//  APButton.swift
//  Appetizers
//
//  Created by Max Roberts on 1/1/24.
//

import SwiftUI

struct APButton: View {
    
    let title: String
    
    var body: some View {
        Text("\(title)")
            .frame(width: 260, height: 50)
            .foregroundColor(Color(.white))
            .background(Color("brandPrimary"))
            .cornerRadius(10)
            .padding()
            .font(.title3)
    }
}

#Preview {
    APButton(title: "Test Title")
}
