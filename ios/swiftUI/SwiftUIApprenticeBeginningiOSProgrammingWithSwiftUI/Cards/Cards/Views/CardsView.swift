//
//  CardView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store:CardStore
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    viewState.selectedCard = store.addCard()
                    viewState.showAllCards = false
                } label: {
                    Text("Add")
                }
                CardListView()
            }
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
    }
}
