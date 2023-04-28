//
//  ContentView.swift
//  Knob
//
//  Created by rhino Q on 2023/04/27.
//

import SwiftUI

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob:View {
    @Binding var value:Double // should be between 0 and 1
    var body: some View {
        KnobShape()
            .fill(Color.primary)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                self.value = self.value < 0.5 ? 1 : 0
            }
    }
}

struct ContentView: View {
    @State var volume: Double = 0.5
    @State var knobSize:CGFloat = 0.1
    
    var body: some View {
        VStack {
            Knob(value: $volume)
            .frame(width:100, height: 100)
            
            HStack {
                Text("Value")
                Slider(value: $volume, in: (0...1))
            }
            
            HStack {
                Text("Knob Size")
                Slider(value: $knobSize, in: (0...0.4))
            }
            
            Button("Toggle") {
                withAnimation(.default) {
                    self.volume = self.volume == 0 ? 1 : 0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
