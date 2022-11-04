//
//  CustomButton.swift
//  UIKitPreview
//
//  Created by rhino Q on 2022/11/04.
// https://ios-development.tistory.com/488

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("not support coder")
    }

    // MARK: - Private

    private func setupView() {
        backgroundColor = .yellow
        setTitleColor(.black, for: .normal)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MyCustomButtonPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let button = CustomButton(frame: .zero)
            button.setTitle("buttonTest", for: .normal)
            return button
        }.previewLayout(.sizeThatFits)
        
        UIViewPreview {
            let button = CustomButton(frame: .zero)
            button.backgroundColor = .blue
            button.setTitle("buttonTest", for: .normal)
            return button
        }.previewDevice(PreviewDevice(rawValue: DeviceType.iPhone12Pro.name))
        
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            UIViewPreview {
                let button = CustomButton(frame: .zero)
                button.setTitle("buttonTest", for: .normal)
                button.backgroundColor = .tertiaryLabel
                return button
            }.environment(\.colorScheme, colorScheme)
            .previewDisplayName("\(colorScheme)")
        }.previewLayout(.sizeThatFits)
        
//        ForEach(ContentSizeCategory.allCases, id: \.self) { sizeCategory in
//            UIViewPreview {
//                let button = CustomButton(frame: .zero)
//                button.setTitle("testButton", for: .normal)
//                button.titleLabel?.font = .preferredFont(forTextStyle: .body)
//                button.titleLabel?.adjustsFontForContentSizeCategory = true
//                return button
//            }.environment(\.sizeCategory, sizeCategory)
//            .previewDisplayName("\(sizeCategory)")
//        }.previewLayout(.sizeThatFits)
//        .padding(10)
    }
}
#endif
