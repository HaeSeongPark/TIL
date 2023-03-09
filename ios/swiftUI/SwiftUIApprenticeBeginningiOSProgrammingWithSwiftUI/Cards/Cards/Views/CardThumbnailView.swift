//
//  CardThumbnailView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct CardThumbnailView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.gray)
            .frame(width:150, height: 250)
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView()
    }
}
