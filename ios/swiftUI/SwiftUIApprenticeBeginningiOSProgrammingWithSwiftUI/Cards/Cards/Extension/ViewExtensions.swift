//
//  ViewExtensions.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import SwiftUI

extension View {
    func resizableView(transform: Binding<Transform>, viewScale: CGFloat = 1) -> some View {
        return modifier(ResizableView(transform: transform, viewScale:viewScale))
    }
}
