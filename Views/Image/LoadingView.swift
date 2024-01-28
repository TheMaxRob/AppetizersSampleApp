//
//  LoadingView.swift
//  Appetizers
//
//  Created by Max Roberts on 12/31/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .controlSize(.large)
                .tint(.green)
        }
        
    }
}
