//
//  ViewState.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI


enum CardListState {
  case list, carousel
}

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedCard = nil
            }
        }
    }
    var selectedCard: Card? {
        didSet {
            if selectedCard == nil {
                selectedElement = nil
            }
        }
    }
    
    @Published var selectedElement: CardElement?
    
    // Determines which view to show in `CardsListView`
    @Published var cardListState: CardListState = .list

    // For sharing the card with a screenshot - see `RenderableView`
    var shouldScreenshot = false
    
    convenience init(card:Card) {
        self.init()
        showAllCards = false
        selectedCard = card
        selectedElement = nil
    }
}
