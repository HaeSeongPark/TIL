//
//  ListSelectionView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/23.
//

import SwiftUI

struct ListSelectionView: View {
    @Binding var selection: CardListState
    
    var body: some View {
      // 1
      Picker(selection: $selection, label: Text("")) {
      // 2
        Image(systemName: "square.grid.2x2.fill")
          .tag(CardListState.list)
        Image(systemName: "rectangle.stack.fill")
          .tag(CardListState.carousel)
    }
    // 3
      .pickerStyle(SegmentedPickerStyle())
      .frame(width: 200)
    }
}

struct ListSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ListSelectionView(selection: .constant(.list))
    }
}
