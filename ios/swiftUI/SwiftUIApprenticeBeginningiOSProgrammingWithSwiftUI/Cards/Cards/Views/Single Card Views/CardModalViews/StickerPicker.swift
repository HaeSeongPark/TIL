//
//  StickerPicker.swift
//  Cards
//
//  Created by rhino Q on 2023/03/12.
//

import SwiftUI

struct StickerPicker: View {
    @State private var stickerNames: [String] = []
    @Environment(\.presentationMode) var presentationMode
    @Binding var stickerImage: UIImage?
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10),
//      GridItem(spacing: 0),
//      GridItem(spacing: 0)
    ]
    
    func loadStickers() -> [String] {
        var themes:[URL] = []
        var stickerNames:[String] = []
        
        let fileManager = FileManager.default
        if let resourcePath = Bundle.main.resourcePath,
           let enumerator = fileManager.enumerator(
            at: URL(fileURLWithPath: resourcePath + "/Stickers"), includingPropertiesForKeys: nil,
            options: [.skipsSubdirectoryDescendants,
                      .skipsHiddenFiles]) {
//            for case let url as URL in enumerator where url.hasDirectoryPath {
//                themes.append(url)
//            }
            while let url = enumerator.nextObject() as? URL {
              if url.hasDirectoryPath {
                themes.append(url)
              }
            }
            
            for theme in themes {
                if let files = try? fileManager.contentsOfDirectory(atPath: theme.path) {
                    for file in files {
                        stickerNames.append(theme.path + "/" + file)
                    }
                }
            }
        }
        
        return stickerNames
    }
    
    func imagee(from path:String) -> UIImage {
        print("loading:", path)
        return UIImage(named: path) ?? UIImage(named: "error-image") ?? UIImage()
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickerNames, id: \.self) { sticker in
                    Image(uiImage: imagee(from: sticker))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            stickerImage = imagee(from: sticker)
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                }
            }
        }
        .onAppear {
            stickerNames = loadStickers()
        }
    }
}

struct StickerPicker_Previews: PreviewProvider {
    static var previews: some View {
        StickerPicker(stickerImage: .constant(UIImage()))
            .previewLayout(PreviewLayout.fixed(width: 896, height: 414))
    }
}
