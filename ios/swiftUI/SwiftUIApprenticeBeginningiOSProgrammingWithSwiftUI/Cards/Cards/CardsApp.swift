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
    @StateObject var store = CardStore(defaultData: true)
    
    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(viewState)
                .environmentObject(store)
        }
    }
}
