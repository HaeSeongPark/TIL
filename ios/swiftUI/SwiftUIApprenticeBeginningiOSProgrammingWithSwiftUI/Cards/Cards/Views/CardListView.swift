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
    
    func columns(size: CGSize) -> [GridItem] {
      [
        GridItem(.adaptive(
          minimum: Settings.thumbnailSize(size: size).width))
      ]
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns(size: proxy.size),spacing: 30) {
                    ForEach(store.cards) { card in
                        CardThumbnailView(card: card, size:proxy.size)
                            .contextMenu {
                                Button {
                                    store.remove(card)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    viewState.showAllCards = false
                                }
                                viewState.selectedCard = card
                            }
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
