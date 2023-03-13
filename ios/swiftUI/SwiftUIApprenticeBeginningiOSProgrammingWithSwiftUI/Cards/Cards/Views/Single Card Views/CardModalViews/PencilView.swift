//
//  PencilView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/13.
//

import SwiftUI
import PencilKit

struct PencilView:View {
    @State private var canvas = PKCanvasView()
    
    var body: some View {
        PencilViewRepresentable(canvas: $canvas)
    }
}

struct PencilViewRepresentable:UIViewRepresentable {
    @Binding var canvas:PKCanvasView
    
    func makeUIView(context: Context) -> some UIView {
        canvas.drawingPolicy = .anyInput
        return canvas
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}


struct PencilView_Previews: PreviewProvider {
  static var previews: some View {
    PencilView()
  }
}
