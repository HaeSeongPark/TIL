//
//  ViewExtensions.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import SwiftUI

extension View {
    func resizableView() -> some View {
        return modifier(ResizableView())
    }
}
