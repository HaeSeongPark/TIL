//
//  CardListView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store:CardStore
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnailView(card: card)
                        .contextMenu {
                            Button {
                                store.remove(card)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                            viewState.selectedCard = card
                        }
                }
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
    }
}
