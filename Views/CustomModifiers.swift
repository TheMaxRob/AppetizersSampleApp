//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Max Roberts on 1/2/24.
//

import SwiftUI

struct standardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View { content
        .buttonStyle(.bordered)
        .tint(Color("brandPrimary"))
        .controlSize(.large)
    }
}
