//
//  ContentView.swift
//  ImageLoading
//
//  Created by rhino Q on 2023/04/28.
//

import SwiftUI

struct PhotoView: View {
    @ObservedObject var image: Remote<UIImage>
    var aspectRatio: CGFloat
    
    init(_ url: URL, aspectRatio: CGFloat) {
        image = Remote(url: url, transform: { UIImage(data: $0) })
        self.aspectRatio = aspectRatio
    }
    
    var imageOrPlaceholder: Image {
        image.value.map(Image.init) ?? Image(systemName: "photo")
    }
    
    var body: some View {
        return ZStack {
            imageOrPlaceholder
                .resizable()
                .foregroundColor(.secondary)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding()
            if image.value == nil {
                ProgressView()
                    .onAppear {
                        image.load()
                    }
            }
        }
    }
}
struct ContentView: View {
    @StateObject var items = Remote(
        url: URL(string: "https://picsum.photos/v2/list")!,
        transform: { try? JSONDecoder().decode([Photo].self, from: $0) }
    )
    
    var body: some View {
        NavigationView {
            if let photos = items.value {
                List(photos) { photo in
                    NavigationLink {
                        PhotoView(photo.download_url, aspectRatio: photo.width/photo.height)

                    } label: {
                        HStack{
                            PhotoView(photo.download_url, aspectRatio: photo.width/photo.height)
                                .frame(width: 100)
                            Text(photo.author)
                        }
                    }
                }
            } else {
                ProgressView()
                    .onAppear { items.load() }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
