//
//  VideoService.swift
//  CoreMediaSample
//
//  Created by rhino Q on 22/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import UIKit
import MobileCoreServices

protocol VideoServiceDelegate {
    func videoDidFinishSaving(error: Error?, url: URL?)
}

class VideoService: NSObject {
    
    var delegate: VideoServiceDelegate?
    
    static let instance = VideoService()
    private override init() {}
}


extension VideoService {
    private func isVideoRecordingAvailable() -> Bool {
        let front = UIImagePickerController.isCameraDeviceAvailable(.front)
        let rear = UIImagePickerController.isCameraDeviceAvailable(.rear)
        
        if !front || !rear {
            return false
        }
        
        guard let media = UIImagePickerController.availableMediaTypes(for: .camera) else {
            return false
        }
        print("availableMediaTypes : \(media)")
        return media.contains(kUTTypeMovie as String)
    }
    
    private func setupVideoRecordingPicker() -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.videoQuality = .typeHigh
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.delegate = self
        return picker
    }
    
    func launchVideoRecorder(in vc: UIViewController, completion: (() -> ())?) {
        guard isVideoRecordingAvailable() else { return }
        
        let picker = setupVideoRecordingPicker()
        
        if Device.isPhone {
            vc.present(picker, animated: true) { completion?() }
        }
    }
    
    private func saveVideo(at mediaUrl: URL) {
        let compatible = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaUrl.path)
        
        if compatible {
            UISaveVideoAtPathToSavedPhotosAlbum(mediaUrl.path, self, #selector(video(videoPath:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @objc func video(videoPath: NSString, didFinishSavingWithError error: NSError?, contextInfo info: AnyObject) {
        let videoURL = URL(fileURLWithPath: videoPath as String)
        self.delegate?.videoDidFinishSaving(error: error, url: videoURL)
    }
    
}


extension VideoService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true) {
            guard let mediaURL = info[.mediaURL] as? URL else { return }
            self.saveVideo(at: mediaURL)
        }
    }
}
