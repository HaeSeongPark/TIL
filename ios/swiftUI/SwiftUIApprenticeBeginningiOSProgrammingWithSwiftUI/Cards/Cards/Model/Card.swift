//
//  Card.swift
//  Cards
//
//  Created by rhino Q on 2023/03/11.
//

import SwiftUI

struct Card:Identifiable {
    let id = UUID()
    var backgroundColor:Color = .yellow
    var elements:[CardElement] = []
    
    mutating func remove(_ element:CardElement) {
        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
    }
    
    mutating func addElement(uiImage: UIImage) {
        let image = Image(uiImage: uiImage)
        let element = ImageElement(image: image)
        elements.append(element)
    }
    
    mutating func update(_ element:CardElement?, frame: AnyShape) {
        if let element = element as? ImageElement,
           let index = element.index(in: elements) {
            var newElement = element
            newElement.frame = frame
            elements[index] = newElement
        }
    }
}
