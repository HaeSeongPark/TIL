//
//  ImageClient.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

final class ImageClient {
  
  static let shared = ImageClient(responseQueue: .main,
                                  session: .shared)
  
  var cachedImageForURL: [URL: UIImage]
  var cachedTaskForImageView: [UIImageView: URLSessionDataTask]
  
  let responseQueue: DispatchQueue?
  let session: URLSession

  init(responseQueue: DispatchQueue?,
       session: URLSession) {
  
    self.cachedImageForURL = [:]
    self.cachedTaskForImageView = [:]
    
    self.responseQueue = responseQueue
    self.session = session
  }
}

// MARK: - ImageService
extension ImageClient {
  func downloadImage(
    fromURL url: URL,
    completion: @escaping (UIImage?, Error?) -> Void)
      -> URLSessionDataTask? {
        if let image = cachedImageForURL[url] {
          completion(image, nil)
          return nil
        }
        let dataTask =
          session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
              self.cachedImageForURL[url] = image
              self.dispatch(image: image, completion: completion)
            } else {
              self.dispatch(error: error, completion: completion)
            }
        }
        dataTask.resume()
        return dataTask
  }
  
  private func dispatch(
    image: UIImage? = nil,
    error: Error? = nil,
    completion: @escaping (UIImage?, Error?) -> Void) {
    
    guard let responseQueue = responseQueue else {
      completion(image, error)
      return
    }
    responseQueue.async { completion(image, error) }
  }
  
  func setImage(on imageView: UIImageView,
                fromURL url: URL,
                withPlaceholder placeholder: UIImage?) {
    
    cachedTaskForImageView[imageView]?.cancel()
    imageView.image = placeholder
    
    cachedTaskForImageView[imageView] =
      downloadImage(fromURL: url) {
        [weak self] image, error in
        guard let self = self else { return }
        self.cachedTaskForImageView[imageView] = nil
        guard let image = image else {
            imageView.image = placeholder
          return
        }
        imageView.image = image
    }
  }
}
