//
//  ContentView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Text("Hello, world!")
                    .background(Color.red)
                Text("Hello, world!")
                    .padding()
                    .background(Color.red)
            }
            .frame(width: proxy.size.width * 0.8)
            .background(Color.gray)
            .padding(.leading, (proxy.size.width - proxy.size.width * 0.8)/2)
        }
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
