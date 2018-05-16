//
//  AlbumCollectionViewController.swift
//  PJT4Album
//
//  Created by rhino Q on 2018. 5. 13..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit
import Photos


class AlbumCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "AlbumCell"
    private let itemForRowOnPortrait:CGFloat = 2
    private let itemForRowOnLandscape:CGFloat = 3
    private let sectionInserts:CGFloat = 16
    
    private var smartAlbums: PHFetchResult<PHAssetCollection>!
    private var userCollections: PHFetchResult<PHCollection>!
    private let imageManager = PHCachingImageManager()
    
    private let sectionLocalizedTitles = ["Smart Albums", "Your Albums"]
    
    private enum Section: Int {
        case smartAlbums = 0
        case userCollections
        static let count = 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    private func checkPermission(){
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationStatus {
        case .authorized:
            print("접근 허가")
           self.requestCollection()
            OperationQueue.main.addOperation {
                self.collectionView?.reloadData()
            }
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("아직응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ status in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.collectionView?.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        default: break
        }
    }
    
    private func requestCollection() {
        smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        userCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? PhotosCollectionViewController else {
            return
        }
        
        guard let cell = sender as? AlbumCollectionViewCell else {
            return
        }

        guard let unwrappedCollectionView = self.collectionView, let indexPath = unwrappedCollectionView.indexPath(for: cell) else {
            return
        }
        
        
        let collection: PHCollection
        
        guard let section = Section(rawValue: indexPath.section) else {
            return
        }
        
        switch section {
        case .smartAlbums:
            collection = smartAlbums.object(at: indexPath.row)
        case .userCollections:
            collection = userCollections.object(at: indexPath.row)
        }
        
        guard let assetCollection = collection as? PHAssetCollection else {
            fatalError("expected asset collection")
        }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        nextVC.fetchResult = PHAsset.fetchAssets(in: assetCollection, options: fetchOptions)
        nextVC.selectedAlbumName = cell.albumName.text
        nextVC.assetCollection = assetCollection
    }
    
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .smartAlbums:
            return smartAlbums?.count ?? 0
        case .userCollections:
            return userCollections?.count ?? 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AlbumCollectionViewCell
            else { fatalError("unexpected cell in collection view") }
        
        guard  let section = Section(rawValue: indexPath.section) else {
            fatalError("unexpected cell in collection view")
        }
        
        switch section {
        case .smartAlbums:
            let collection = smartAlbums?.object(at: indexPath.row)
            cell.albumName.text = collection?.localizedTitle
            
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            let fetchResult = PHAsset.fetchAssets(in: collection!, options: fetchOptions)
            
            cell.photosCountInAlbum.text = fetchResult.count.description
            
            if fetchResult.count > 0 {
                imageManager.requestImage(for: fetchResult.object(at: 0), targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFit, options: nil) { (image, _) in
                    cell.representImage = image
                }
            } else {
                cell.representImage = UIImage(named: "sampleImage")
            }
            
            
            return cell
        case .userCollections:
            let collection = userCollections?.object(at: indexPath.row)
            
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            let fetchResult = PHAsset.fetchAssets(in: collection! as! PHAssetCollection, options: fetchOptions)
            cell.albumName.text = collection?.localizedTitle
            cell.photosCountInAlbum.text = fetchResult.count.description
            
            if fetchResult.count > 0 {
                imageManager.requestImage(for: fetchResult.object(at: 0), targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFit, options: nil) { (image, _) in
                    cell.representImage = image
                }
            } else {
                cell.representImage = UIImage(named: "sampleImage")
            }
            
            
            return cell
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "albumHeader", for: indexPath) as! AlbumCollectionReusableView
            headerView.headerNameLbl.text = sectionLocalizedTitles[indexPath.section]
            return headerView
        default: assert(false, "Unexpected element kind")

        }
    }
    
//     MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let currentOrientation = UIDevice.current.orientation
         let isPortrait = currentOrientation == UIDeviceOrientation.portrait || currentOrientation == UIDeviceOrientation.portraitUpsideDown
         var width:CGFloat = 0
         var height:CGFloat = 0

        if isPortrait {
            width = collectionView.frame.width / itemForRowOnPortrait - ( itemForRowOnPortrait * sectionInserts )
        } else {
            width = collectionView.frame.width / itemForRowOnLandscape - ( itemForRowOnLandscape * sectionInserts )
        }

        height = width + 50

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(sectionInserts, sectionInserts, sectionInserts, sectionInserts)
    }
}

extension AlbumCollectionViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.sync {
            
            requestCollection()
            self.collectionView?.reloadData()

        }
    }
}


