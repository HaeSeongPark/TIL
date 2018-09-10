//
//  ViewController.swift
//  PushImage
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import Alamofire

class HomeViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var staticLabel: NSTextField!
    @IBOutlet weak var loadingSpinner: NSProgressIndicator!
    @IBOutlet weak var dragView: DragView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dragView.delegate = self
        loadingSpinner.isHidden = true
    }
    
    fileprivate func showSuccessAlert(url :String) {
        let alert = NSAlert()
        alert.messageText = url
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Copy to clipboard")
        let response = alert.runModal()
        if response == NSApplication.ModalResponse.alertFirstButtonReturn {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(url, forType: .string)
        }
    }
}

extension HomeViewController: DragViewDelegate {
    func dragView(didDragFileWith URL: URL) {
        
        loadingSpinner.isHidden = false
        loadingSpinner.startAnimation(self.view)
        staticLabel.isHidden = true
        
        Alamofire.upload(multipartFormData: { (data: MultipartFormData) in
            data.append(URL, withName: "upload")
        }, to: "http://uploads.im/api?format=json") { [weak self] (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    guard
                        let dataDict = response.result.value as? NSDictionary,
                        let data = dataDict["data"] as? NSDictionary,
                        let imgUrl = data["img_url"] as? String else { return }
                    
                    self?.loadingSpinner.isHidden = true
                    self?.loadingSpinner.stopAnimation(self?.view)
                    self?.staticLabel.isHidden = false
                    self?.showSuccessAlert(url: imgUrl)
                    
                    print(imgUrl)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
}
