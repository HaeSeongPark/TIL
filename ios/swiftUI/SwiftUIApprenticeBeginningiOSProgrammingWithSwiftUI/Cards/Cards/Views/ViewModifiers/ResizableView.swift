//
//  ResizableVIew.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import SwiftUI

struct ResizableView: ViewModifier {
    @Binding var transform:Transform
    @State private var previouseOffset:CGSize = .zero
    @State private var previousRotation: Angle = .zero
    @State private var scale: CGFloat = 1.0
    let selected:Bool
    
    func body(content:Content) -> some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previouseOffset
            }
            .onEnded { _ in
                previouseOffset = transform.offset
            }
        
        let rotationGesture = RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        
        let scaleGesture = MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0
            }
        
        content
            .frame(width:transform.size.width,
                   height: transform.size.height)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
            .onAppear {
                previouseOffset = transform.offset
            }
    }
}

struct ResizableVIew_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 30.0)
            .foregroundColor(Color.red)
            .resizableView(transform: .constant(Transform()), selected: true)
    }
}
