//
//  ViewControllerPreview.swift
//  UIKitPreview
//
//  Created by rhino Q on 2022/11/04.
//

#if canImport(SwiftUI) && DEBUG
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name))
    }
}

import SwiftUI

struct ViewController_Preview: PreviewProvider {
    static let deviceTypes:[DeviceType] = [.iPhone8, .iPhone12Pro]
    static var previews: some View {
        ForEach(deviceTypes, id:\.self) { deviceType in
            ViewController().showPreview(deviceType)
                .previewDisplayName(deviceType.name)
        }
    }
}
#endif
