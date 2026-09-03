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


extension Image {
    func listCellImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: ContentMode.fit)
            .frame(width: 120, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
