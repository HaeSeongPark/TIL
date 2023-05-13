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

//struct Knob:View {
//    @Binding var value:Double // should be between 0 and 1
//    var body: some View {
////        KnobShape()
////            .fill(Color.primary)
////            .rotationEffect(Angle(degrees: value * 330))
////            .onTapGesture {
////                self.value = self.value < 0.5 ? 1 : 0
////            }
//
//        VStack {
//            Text("Hello World")
////                .transformEnvironment(\.font) { dump($0)}
//        }
////        .font(Font.headline)
//        .environment(\.font, Font.headline)
//        .debug()
//    }
//}

struct Knob:View {
    @Binding var value:Double // should be between 0 and 1
    
    @Environment(\.colorScheme) var colorScheme
    
    var pointerSize:CGFloat? = nil
    @Environment(\.knobPointerSize) var envPointerSize
    
    @Environment(\.knobColor) var envColor
    
    private var fillColor:Color {
        envColor ?? (colorScheme == .dark ? Color.white : Color.black)
    }
    
    var body: some View {
        KnobShape(pointerSize: pointerSize ?? envPointerSize)
            .fill(fillColor)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                self.value = self.value < 0.5 ? 1 : 0
            }
    }
}

struct ContentView: View {
    @State var volume: Double = 0.5
    @State var knobSize:CGFloat = 0.1
    @State var hue: Double = 0
    @State var useDefaultColor = true
    
    var body: some View {
        VStack {
            Knob(value: $volume)
                .frame(width:100, height: 100)
                .knobPointerSize(0.1)
                .knobColor(useDefaultColor ? nil : Color(hue: hue, saturation: 1, brightness: 1))
            
            HStack {
                Text("Value")
                Slider(value: $volume, in: (0...1))
            }
            
            HStack {
                Text("Knob Size")
                Slider(value: $knobSize, in: (0...0.4))
            }
            
            HStack {
                Text("Color")
                Slider(value: $hue, in: (0...1))
            }
            
            
            Toggle("Default Color", isOn: $useDefaultColor)
            
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



extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
    func debug<A: View>(_ a: A) -> some View {
        print(Mirror(reflecting: a).subjectType)
        return a
    }
}


extension View {
    func knobPointerSize(_ size: CGFloat) -> some View {
        environment(\.knobPointerSize, size)
    }
}


fileprivate struct PointerSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0.1
}

extension EnvironmentValues {
    var knobPointerSize:CGFloat {
        get { self[PointerSizeKey.self] }
        set { self[PointerSizeKey.self] = newValue }
    }
}


struct MyNavigationTittleKey:PreferenceKey {
    static var defaultValue: String? = nil
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = value ?? nextValue()
    }
}

extension View {
    func myNavigationTitle(_ title:String) -> some View {
        preference(key: MyNavigationTittleKey.self, value:title)
    }
}


struct  MyNavigationView<Content>:View where Content:View {
    let content:Content
    @State private var title:String? = nil
    var body: some View {
        VStack{
            Text(title ?? "")
                .font(Font.largeTitle)
            content.onPreferenceChange(MyNavigationTittleKey.self) { title in
                self.title = title
            }
        }
    }
}

// exercises
fileprivate struct ColorKey:EnvironmentKey {
    static var defaultValue: Color? = nil
}

extension EnvironmentValues {
    var knobColor:Color? {
        get { self[ColorKey.self] }
        set { self[ColorKey.self] = newValue }
    }
}

/*
 extension View {
     func knobPointerSize(_ size: CGFloat) -> some View {
         environment(\.knobPointerSize, size)
     }
 }
 */
extension View {
    func knobColor(_ color:Color?) -> some View {
        environment(\.knobColor, color)
    }
}
