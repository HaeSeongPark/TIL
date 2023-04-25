//
//  ContentView.swift
//  TapMe
//
//  Created by rhino Q on 2023/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
            Button {
                self.counter += 1
            } label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            }
            
            if counter > 0 {
                Text("You've tapped \(counter) tiems")
            } else {
                Text("You've not yet tapped")
            }

        }
//        .debug()
//        .border(Color.black)
//        .frame(width: 200, height: 200)
        .frame(width: 200, height: 200)
        .border(Color.black)
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
