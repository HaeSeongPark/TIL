//
//  SingleCardView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewState:ViewState
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        if let selectedCard = viewState.selectedCard,
           let index = store.index(for: selectedCard ){
            NavigationView {
                CardDetailView(card: $store.cards[index])
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Title")
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView()
            .environmentObject(ViewState(card: initialCards[0]))
            .environmentObject(CardStore(defaultData: true))
    }
}

