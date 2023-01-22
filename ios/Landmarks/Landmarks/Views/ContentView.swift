//
//  ContentView.swift
//  Landmarks
//
//  Created by rhino Q on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmakrList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
