//
//  ViewState.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedCard = nil
            }
        }
    }
    var selectedCard: Card?
    
    convenience init(card:Card) {
        self.init()
        showAllCards = false
        selectedCard = card
    }
}
