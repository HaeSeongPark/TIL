//
//  CardModal.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import Foundation

enum CardModal:Identifiable {
    var id:Int {
        hashValue
    }
    case photoPicker, framePicker, stickerPicker, textPicker, shareSheet
}
