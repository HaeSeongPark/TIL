//
//  CardThumbnailView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct CardThumbnailView: View {
    let card: Card
    var size:CGSize = .zero
    
    var body: some View {
//        RoundedRectangle(cornerRadius: 15)
//            .foregroundColor(card.backgroundColor)
        card.backgroundColor
            .cornerRadius(10)
            .frame(width:Settings.thumbnailSize(size: size).width,
                   height: Settings.thumbnailSize(size:size).height)
            .shadow(color: Color("shadow-color"), radius: 3, x: 0.0, y: 0.0)
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[0])
    }
}
