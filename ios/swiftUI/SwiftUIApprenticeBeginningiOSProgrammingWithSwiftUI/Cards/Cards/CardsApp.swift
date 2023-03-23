//
//  CardsApp.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

@main
struct CardsApp: App {
    @StateObject var viewState = ViewState()
    @StateObject var store = CardStore(defaultData:false)
    
    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .environmentObject(viewState)
                .environmentObject(store)
                .onAppear {
                  print(FileManager.documentURL ?? "")
                }
        }
    }
}
