//
//  SingleCardView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewState:ViewState
    
    var body: some View {
        NavigationView {
            CardDetailView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Title")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView()
            .environmentObject(ViewState())
    }
}

