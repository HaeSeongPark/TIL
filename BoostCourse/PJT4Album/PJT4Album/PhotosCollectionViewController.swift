//
//  PhotosCollectionViewController.swift
//  PJT4Album
//
//  Created by rhino Q on 2018. 5. 13..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit
import Photos


class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "image"
    private let itemForRowOnPortrait:CGFloat = 3
    private let itemForRowOnLandscape:CGFloat = 5
    private let sectionInserts:CGFloat = 8
    
    @IBOutlet var space: UIBarButtonItem!
    @IBOutlet var trashBtn: UIBarButtonItem!
    @IBOutlet var shareBtn: UIBarButtonItem!
    @IBOutlet var sortBtn: UIBarButtonItem!
    
    private var assets = [PHAsset]()
    var fetchResult: PHFetchResult<PHAsset>!
    var assetCollection: PHAssetCollection!
    
    private let imageManager = PHCachingImageManager()
    private var cellSize: CGSize!
    
    var selectedAlbumName:String? {
        didSet {
            navigationItem.title = selectedAlbumName
        }
    }
    
    private var sharing = false {
        didSet {
            collectionView?.allowsMultipleSelection = sharing
        }
    }
    
    private func updateSelectedPhtos() {
        navigationItem.title = "\(assets.count) 선택"
        if assets.count > 0 {
            shareBtn.isEnabled = true
            trashBtn.isEnabled = true
        } else {
            shareBtn.isEnabled = false
            trashBtn.isEnabled = false
        }
    }
    
    @IBOutlet weak var selectBtn: UIBarButtonItem!
    @IBAction func tapSelectBtn(_ sender: UIBarButtonItem) {
        
        if sender.title == "선택" {
            enableShare()
        } else {
            disEnableShare()
        }
    }
    
    private func enableShare() {
        sharing = true
        selectBtn.title = "취소"
        updateSelectedPhtos()
        sortBtn.isEnabled = false
    }
    
    private func disEnableShare() {
        sharing = false
        selectBtn.title = "선택"
        assets.removeAll(keepingCapacity: false)
        updateSelectedPhtos()
        navigationItem.title = selectedAlbumName
        sortBtn.isEnabled = true
        deSelectCells()
    }
    
    private func deSelectCells() {
        guard let indexPathsForSelectedItems = collectionView?.indexPathsForSelectedItems else {
            return
        }
    
        for indexPathForSelectedItem in indexPathsForSelectedItems {
        collectionView?.deselectItem(at: indexPathForSelectedItem, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        toolbarItems = [shareBtn, space, sortBtn, space, trashBtn]
        navigationController?.isToolbarHidden = false
        cellSize = (collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        
    }

    @IBAction func sortCreateDate(_ sender: UIBarButtonItem) {
        let fetchOptions = PHFetchOptions()
        if sender.title == "최신순" {
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            fetchResult = PHAsset.fetchAssets(in: assetCollection, options: fetchOptions)
            collectionView?.reloadData()
            sender.title = "과거순"
        } else {
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            fetchResult = PHAsset.fetchAssets(in: assetCollection, options: fetchOptions)
            collectionView?.reloadData()
            sender.title = "최신순"
        }
    }
    
    @IBAction func removeAsset(_ sender: UIBarButtonItem) {
        
        let completion = { (success: Bool, error: Error?) -> () in
            if success {
                OperationQueue.main.addOperation {
                    self.disEnableShare()
                }
            } else {
                print("can't remove asset: \(error!)")
            }
        }
        if !assets.isEmpty {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets(self.assets as NSFastEnumeration)

            }, completionHandler: completion)
        }
    }
    
    @IBAction func shareAsset(_ sender: UIBarButtonItem) {
        var imageArray = [UIImage]()
        for asset in assets {
            imageManager.requestImage(for: asset, targetSize: cellSize, contentMode: .aspectFill, options: nil) { (image, _) in
                if let unwrappedImage = image {
                    imageArray.append(unwrappedImage)
                }
            }
        }
        
        
        if !imageArray.isEmpty {
            let activityVC = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
            activityVC.completionWithItemsHandler = { (activity, success, items, error) in
                if success {
                    self.disEnableShare()
                }
            }
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? PhotoViewController else {
            return
        }
    
        guard let index = sender as? IndexPath else {
            return
        }
        
        let asset = self.fetchResult[index.row]
        nextVC.asssetCreateDate = asset.creationDate
        nextVC.asset = asset
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("unexpected cell in collection view")
        }
        if fetchResult.count > 0 {
            imageManager.requestImage(for: fetchResult.object(at: indexPath.row), targetSize: cellSize, contentMode: .aspectFit, options: nil) { (image, _) in
                
                if let unwrappedImage = image {
                    cell.photo = unwrappedImage
                }
            }
        }

        return cell
    }
    
    //     MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentOrientation = UIDevice.current.orientation
        let isPortrait = currentOrientation == UIDeviceOrientation.portrait || currentOrientation == UIDeviceOrientation.portraitUpsideDown
        var width:CGFloat = 0
        
        if isPortrait {
            width = collectionView.frame.width / itemForRowOnPortrait - sectionInserts
        } else {
            width = collectionView.frame.width / itemForRowOnLandscape - sectionInserts
        }
        
        return CGSize(width: width, height: width)
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if sharing {
            return true
        } else {
            performSegue(withIdentifier: "photo", sender: indexPath)
            return false
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if sharing {
            assets.append(fetchResult[indexPath.row])
            updateSelectedPhtos()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let indexAssets = assets.index(of: fetchResult[indexPath.row]) {
            assets.remove(at: indexAssets)
            updateSelectedPhtos()
        }
    }
}

extension PhotosCollectionViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        
        guard let changes = changeInstance.changeDetails(for: fetchResult) else {
            return
        }
        fetchResult = changes.fetchResultAfterChanges
        OperationQueue.main.addOperation {
            self.collectionView?.reloadData()
        }
    }
}
