//
//  PhotoViewController.swift
//  PJT4Album
//
//  Created by rhino Q on 2018. 5. 15..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit
import Photos

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    var asset: PHAsset!
    private let imageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var shareBtn: UIBarButtonItem!
    @IBOutlet var likeBtn: UIBarButtonItem!
    @IBOutlet var space: UIBarButtonItem!
    @IBOutlet var trashBtn: UIBarButtonItem!
    
    var asssetCreateDate:Date! {
        didSet {
            topText = dateFormatter.string(from: asssetCreateDate)
            bottomText = timeFormatter.string(from: asssetCreateDate)
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()
    
   private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "a HH:mm:ss"
        return formatter
    }()
    
    private var topText = ""
    private var bottomText = ""
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        self.navigationController?.setToolbarHidden(true, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.setToolbarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func shareImage(_ sender: UIBarButtonItem) {
        
        let activityVC = UIActivityViewController(activityItems: [self.imageView.image!], applicationActivities: nil)
        activityVC.completionWithItemsHandler = { (activity, success, items, error) in
            if success {
               print("success")
            }
        }
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func likeImage(_ sender: UIBarButtonItem) {
        PHPhotoLibrary.shared().performChanges({
            let request = PHAssetChangeRequest(for: self.asset)
            request.isFavorite = !self.asset.isFavorite
        }, completionHandler: { success, error in
            if success {
                DispatchQueue.main.sync {
                    sender.title = !self.asset.isFavorite ? "❤️" : "🖤"
                }
            } else {
                print("can't set favorite")
            }
        })
    }
    
    @IBAction func removeImage(_ sender: UIBarButtonItem) {
        
        let completion = { (success: Bool, error: Error?) -> () in
            if success {
                PHPhotoLibrary.shared().unregisterChangeObserver(self)
                DispatchQueue.main.sync {
                    _ = self.navigationController!.popViewController(animated: true)
                }
            } else {
                print("can't remove asset: \(error!)")
            }
        }
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.deleteAssets([self.asset] as NSArray)
        }, completionHandler: completion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.shared().register(self)
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFit, options: nil) { (image, _) in
            self.imageView.image = image
        }
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        toolbarItems = [shareBtn, space, likeBtn, space, trashBtn]
        likeBtn.title = asset.isFavorite ? "❤️" : "🖤"
        setupTitleView()
    }
    
    private func setupTitleView() {
        
        let titleAttributes = [ NSAttributedStringKey.foregroundColor : UIColor.black,
                                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]
        let subtitleAttributes = [ NSAttributedStringKey.foregroundColor : UIColor.darkGray,
                                   NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        
        let title = NSMutableAttributedString(string: topText, attributes: titleAttributes)
        let subtitle = NSAttributedString(string: bottomText, attributes: subtitleAttributes)
        title.append(NSAttributedString(string: "\n"))
        title.append(subtitle)
        
        let size = title.size()
        
        let width = size.width
        guard let height = navigationController?.navigationBar.frame.size.height else {return}
        
        let titleLabel = UILabel(frame: CGRect(x:0,y:0, width:width, height:height))
        titleLabel.attributedText = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        navigationItem.titleView = titleLabel
    }
}


// MARK: PHPhotoLibraryChangeObserver
extension PhotoViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.sync {
            guard let details = changeInstance.changeDetails(for: asset) else {
                print("no change")
                return
            }
            
            if let changedAsset = details.objectAfterChanges{
                asset = changedAsset
            }
        }
    }
}
