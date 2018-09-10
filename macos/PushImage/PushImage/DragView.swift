//
//  DragView.swift
//  PushImage
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// origin : https://www.appcoda.com/macos-image-uploader-app/

import Cocoa

protocol DragViewDelegate {
    func dragView(didDragFileWith URL: URL)
}

class DragView: NSView {
    
    var delegate: DragViewDelegate?
    
    /*
     1 – Firstly, we need to create a boolean flag call fileTypeIsOk, defaulted to false to help us push forward only the right file format of our images. We also create a acceptedFileExtensions which is an array of acceptable file format in string.
    */
    private var fileTypeIsOk = false
    private var acceptedFileExtensions = ["jpg", "png"]
    
    static let NSPastboardTypeFileUrl = NSPasteboard.PasteboardType.fileURL
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        registerForDraggedTypes([DragView.NSPastboardTypeFileUrl])
    }
    
    /*
     2 – draggingEntered function will be called when the file first enter the “drop area”. Here, we will call a function checkExtension which we will discuss later, to set our fileTypeIsOk boolean to true if the file type is of .jpg or false if it is not.
    */
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        fileTypeIsOk = checkExtension(drag: sender)
        return []
    }
    
    /*
     3 – draggingUpdated function is implemented here to get the details of the image. In this case, if the fileTypeIsOk, we will return the copy of the image, else it will return an empty data represented by [].
    */
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return fileTypeIsOk ? .copy : []
    }
    
    /*
     4 – performDragOperation function is called once the user releases his mouse, we will make use of this function to pass the url to our HomeViewController later
    */
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let draggedFileUrl = sender.draggedFileUrl else {
            return false
        }
        
        if fileTypeIsOk {
            delegate?.dragView(didDragFileWith: draggedFileUrl)
        }
        
        return true
    }
    
    /*
     5 – checkExtension is our “home-made” function where we check our drag object, grab the url of the file coming in, and check if it complies with our acceptedFileExtensions
    */
    fileprivate func checkExtension(drag: NSDraggingInfo) -> Bool {
        guard let fileExtension = drag.draggedFileUrl?.pathExtension.lowercased() else {
            return false
        }
        return acceptedFileExtensions.contains(fileExtension)
    }
}

/*
 6 – Here, we extend our NSDraggingInfo which is actually all the senders we see in our draggingEntered and draggingUpdated. We added a variable call draggedFileURL here to reference the url of our image file.
 */


extension NSDraggingInfo {
    var draggedFileUrl: URL? {
        
        guard let drggingPasteboardFileUrl = draggingPasteboard().propertyList(forType: DragView.NSPastboardTypeFileUrl) as? String else {
            return nil
        }
        
        return URL(string: drggingPasteboardFileUrl)
    }
}
