//
//  TextPicker.swift
//  Cards
//
//  Created by rhino Q on 2023/03/19.
//

import SwiftUI

struct TextPicker: View {
    @Binding var textElement:TextElement
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        let onCommit = {
            presentationMode.wrappedValue.dismiss()
        }
        TextField("Enter text", text: $textElement.text, onCommit: onCommit)
            .font(.custom(textElement.textFont, size: 30))
            .foregroundColor(textElement.textColor)
        TextView(font: $textElement.textFont, color: $textElement.textColor)
    }
}

struct TextPicker_Previews: PreviewProvider {
  @State static var textElement = TextElement()
  static var previews: some View {
    TextPicker(textElement: $textElement)
  }
}
