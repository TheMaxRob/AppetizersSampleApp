//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Max Roberts on 1/1/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .opacity(0.6)
                .foregroundColor(.white)
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundColor(.black)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    XDismissButton()
}
