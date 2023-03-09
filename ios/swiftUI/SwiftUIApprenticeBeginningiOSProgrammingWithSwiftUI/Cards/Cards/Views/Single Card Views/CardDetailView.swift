//
//  CardDetailView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState:ViewState
    @State private var currentModal: CardModal?
    
    var body: some View {
        Color.yellow
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


struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
            .environmentObject(ViewState())
    }
}
