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

    var createButton: some View {
        Button {
            viewState.selectedCard = store.addCard()
            viewState.showAllCards = false
        } label: {
            Label("Create New", systemImage: "plus")
                .frame(maxWidth: .infinity)
        }
        .font(.system(size: 16, weight: .bold))
        .padding([.top, .bottom], 10)
        .background(Color("barColor"))
        .accentColor(.white)

    }
    
    var body: some View {
        ZStack {
            CardListView()
            VStack {
                Spacer()
                createButton
            }
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
        .background(
            Color("background")
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
    }
}
