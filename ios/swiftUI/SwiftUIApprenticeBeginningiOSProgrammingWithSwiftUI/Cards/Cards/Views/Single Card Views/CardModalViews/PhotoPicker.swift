//
//  PhotoPicker.swift
//  Cards
//
//  Created by rhino Q on 2023/03/13.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    class PhotosCoordinator:NSObject, PHPickerViewControllerDelegate {
        var parent:PhotoPicker
        
        init(parent:PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            let itemProviders = results.map(\.itemProvider)
            for item in itemProviders {
                // load the iamge from the item here
                if item.canLoadObject(ofClass: UIImage.self) {
                    item.loadObject(ofClass: UIImage.self) { image, error in
                        if let error = error {
                            print("Error!", error.localizedDescription)
                        } else {
                            DispatchQueue.main.async {
                                if let image = image as? UIImage {
                                    self.parent.iamges.append(image)
                                }
                            }
                        }
                    }
                }
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Binding var iamges:[UIImage]
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0
        let picker = PHPickerViewController(configuration: configuration)
        
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeCoordinator() -> PhotosCoordinator {
        PhotosCoordinator(parent: self)
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
//        Text("Hello SwiftUI!")
        PhotoPicker(iamges: .constant([UIImage]()))
            .background(Color.yellow)
    }
}
