//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Azat Japarov on 03.09.26.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
