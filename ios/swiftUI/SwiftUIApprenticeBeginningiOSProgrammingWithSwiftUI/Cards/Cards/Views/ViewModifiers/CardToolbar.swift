//
//  CardToolbar.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import SwiftUI

struct CardToolbar: ViewModifier {
    @Binding var currentModal: CardModal?
    @EnvironmentObject var viewState:ViewState
    
    func body(content:Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                  // swiftlint:disable:next multiple_closures_with_trailing_closure
                  Button(action: { viewState.showAllCards.toggle() }) {
                    Text("Done")
                  }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    CardBottomToolbar(cardModal: $currentModal)
                }
            }
    }
}
