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
    
    var content: some View {
        ZStack {
            Group {
                Capsule()
                    .foregroundColor(.yellow)
                Text("Resize Me!")
                    .fontWeight(.bold)
                    .font(.system(size:500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
            .resizableView()
            
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }
    }
    
    var body: some View {
        content
            .modifier(CardToolbar(currentModal:$currentModal))
    }
}


struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
            .environmentObject(ViewState())
    }
}
