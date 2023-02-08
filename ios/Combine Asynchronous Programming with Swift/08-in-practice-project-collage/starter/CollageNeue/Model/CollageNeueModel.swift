/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import Photos
import Combine

class CollageNeueModel: ObservableObject {
  static let collageSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
  
  private var subscriptions = Set<AnyCancellable>()
  private let images = CurrentValueSubject<[UIImage], Never>([])
  /*
   CurrentValueSubject는 상태를 나타내는데 쓴다. 포도배열이나, 로딩 상태나
   PassthroughSubject는 이벤트를 나타내는데 쓴다. 버튼탭등 어떤 이벤트가 일어난 것을 알리는 등
   */
  
  @Published var imagePreview:UIImage?
  let updateUISubject = PassthroughSubject<Int,Never>()
  
  private(set) var selectedPhotosSubject = PassthroughSubject<UIImage, Never>()
  // MARK: - Collage
  
  private(set) var lastSavedPhotoID = ""
  private(set) var lastErrorMessage = ""

  func bindMainView() {
    images
      .handleEvents(receiveOutput: { [weak self ] photos in
        self?.updateUISubject.send(photos.count)
      })
      .map { photos in
        UIImage.collage(images: photos, size: Self.collageSize)
      }
      .assign(to: &$imagePreview)
  }

  func add() {
    selectedPhotosSubject = PassthroughSubject<UIImage, Never>()
    
    let newPhotos = selectedPhotosSubject
      .handleEvents(receiveCancel: {
        print("selectedPhotosSubject cancel")
      })
      .prefix(while:  { [unowned self ] _ in
        self.images.value.count < 6  // 5이하일 떄만 받아서 최종적으로 6개가 되고 그 이후부터는 스트림 종료
      })
      .share() // newPhotos를 가지고 다른 여러가지 일을 할 수 있기 때문에 share()사용 // 구독 이후에 이벤트만 받는다.
    
    newPhotos
      .handleEvents(receiveCompletion: { print( "newPhotos \($0)")})
      .map { [ unowned self] newImage in
        return self.images.value + [newImage]
      }.assign(to: \.value,on: images)
      .store(in: &subscriptions)
  }

  func clear() {
    images.send([])
  }

  func save() {
    guard let image = imagePreview else { return }
    
    PhotoWriter.save(image)
      .sink { [unowned self ] completion in
        if case .failure(let error) = completion {
          lastErrorMessage = error.localizedDescription
        }
        clear()
      } receiveValue: { [unowned self] id in
        lastSavedPhotoID = id
      }
      .store(in: &subscriptions)

  }
  
  // MARK: -  Displaying photos picker
  private lazy var imageManager = PHCachingImageManager()
  private(set) var thumbnails = [String: UIImage]()
  private let thumbnailSize = CGSize(width: 200, height: 200)

  func bindPhotoPicker() {
    
  }
  
  func loadPhotos() -> PHFetchResult<PHAsset> {
    let allPhotosOptions = PHFetchOptions()
    allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
    return PHAsset.fetchAssets(with: allPhotosOptions)
  }

  func enqueueThumbnail(asset: PHAsset) {
    guard thumbnails[asset.localIdentifier] == nil else { return }
    
    imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
      guard let image = image else { return }
      self.thumbnails[asset.localIdentifier] = image
    })
  }
  
  func selectImage(asset: PHAsset) {
    imageManager.requestImage(
      for: asset,
      targetSize: UIScreen.main.bounds.size,
      contentMode: .aspectFill,
      options: nil
    ) { [weak self] image, info in
      guard let self = self,
            let image = image,
            let info = info else { return }
      
      if let isThumbnail = info[PHImageResultIsDegradedKey as String] as? Bool, isThumbnail {
        // Skip the thumbnail version of the asset
        return
      }
      
      // Send the selected image
      self.selectedPhotosSubject.send(image)
    }
  }
}
