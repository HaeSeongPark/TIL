//
//  CardDrop.swift
//  Cards
//
//  Created by rhino Q on 2023/03/13.
//

import SwiftUI

struct CardDrop:DropDelegate {
    @Binding var card:Card
    var size: CGSize = .zero
    var frame: CGRect = .zero
    
    func performDrop(info: DropInfo) -> Bool {
        let itemProviders = info.itemProviders(for: [.image])
        
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { image, _ in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            let offset = calculateOffset(location:info.location)
                            let transform = Transform(offset: offset)
                            card.addElement(uiImage: image, transform: transform)
                        }
                    }
                }
            }
            
        }
        
        return true
    }
    
    func calculateOffset(location: CGPoint) -> CGSize {
      guard size.width > 0 && size.height > 0 else { return .zero }
      // `frame` is a CGRect bounding the whole area including margins
      // surrounding the card
      // size is the calculated card size without margins

      // margins are the frame around the card
      // plus the frame's origin, if the frame is inset
      let leftMargin = (frame.width - size.width) * 0.5 + frame.origin.x
      let topMargin = (frame.height - size.height) * 0.5 + frame.origin.y

      // location is in screen coordinates
      // convert location from screen space to card space
      // top left of the screen is the old origin
      // top left of the card is the new origin
      var cardLocation = CGPoint(x: location.x - leftMargin, y: location.y - topMargin)

      // convert cardLocation into the fixed card coordinate space
      // so that the location is in 1300 x 2000 space
      cardLocation.x = cardLocation.x / size.width * Settings.cardSize.width
      cardLocation.y = cardLocation.y / size.height * Settings.cardSize.height

      // calculate the offset where 0, 0 is at the center of the card
      let offset = CGSize(
        width: cardLocation.x - Settings.cardSize.width * 0.5,
        height: cardLocation.y - Settings.cardSize.height * 0.5)
      return offset
    }
}
        
