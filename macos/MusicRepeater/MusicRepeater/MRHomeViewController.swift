//
//  ViewController.swift
//  MusicRepeater
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// https://www.appcoda.com/macos-app-development/

import Cocoa
import KDEAudioPlayer

class MRHomeViewController: NSViewController {
    
    var musicFilePath: String?
    
    var audioPlayer = AudioPlayer()
    
    lazy var uploadView: MRUploadView = {
        //1
        /*
         Here we are initialising a new NSNib object from our Xib file. As our Xib file is in the main bundle, there is no need to specify any bundle here.
 */
        let nib = NSNib(nibNamed: NSNib.Name(rawValue:"MRUploadView"), bundle: nil)
        
        //2
        /*
         Next, we declare an array of objects to store the view objects contained in the Xib file. Taking a look at the instantiate method, we set the nib’s owner as self which is our MRHomeViewController, and there is another unfamiliar parameter that the method is taking in, its call AutoreleasingUnsafeMutablePointer. One good thing about such parameter is that once the method ends, the reference to the objects variable will be gone, freeing up memory. We have to prefix our parameter with & because it’s also an inout parameter, whenever our objects is modified, it will affect the passed-in parameter too.
 */
        var objects: NSArray?
        nib?.instantiate(withOwner: self, topLevelObjects: &objects)
        
        //3
        /*
         we loop through the objects found in the Xib and search for the MRUploadView object. Once found, return it to the uploadView variable.
         */
        if let objects = objects, let uploadView = objects.filter({ $0 is MRUploadView }).first as? MRUploadView {
            return uploadView
        }
        
        //4
        /*
         If nothing is found, we will just create a new MRUploadView object.
 */
        return MRUploadView()
    }()
    
    var repeaterView: MRRepeaterView = {
        //1
        let nib = NSNib(nibNamed: NSNib.Name("RepeaterView"), bundle: nil)
        
        //2
        
        var objects: NSArray?
        nib?.instantiate(withOwner: self, topLevelObjects: &objects)
        
        //3
        if let objects = objects, let repeaterView = objects.filter({ $0 is MRRepeaterView }).first as? MRRepeaterView {
            return repeaterView
        }
        
        //4
        return MRRepeaterView()
    }()

    var playingView: MRPlayingView = {
        //1
        let nib = NSNib(
            nibNamed: NSNib.Name(rawValue: "MRPlayingView"),
            bundle: nil
        )
        
        //2
        var objects: NSArray?
        nib?.instantiate(withOwner: self, topLevelObjects: &objects)
        
        //3
        if let objects = objects,
            let playingView = objects
                .filter( { $0 is MRPlayingView } )
                .first as? MRPlayingView {
            return playingView
        }
        
        //4
        return MRPlayingView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        showStep1()
    }
    
    fileprivate func showStep1 () {
        //Init Upload View
        uploadView.frame = self.view.frame
        
        uploadView.delegate = self
        self.view.addSubview(uploadView)
    }
    
    fileprivate func showStep2() {
        // init repeater view
        repeaterView.frame = self.view.frame
        
        
        repeaterView.delegate = self
        repeaterView.isHidden = false
        
        //hide upload view
        uploadView.isHidden = true
        
        self.view.addSubview(repeaterView)
    }
    
    fileprivate func showStep3() {
        //Init Playing View
        playingView.frame = self.view.frame
        playingView.delegate = self
        
        //Hide Repeater View
        repeaterView.isHidden = true
        
        playingView.staticLabel.isHidden = false
        playingView.staticLabel.stringValue = "Playing"
        
        self.view.addSubview(playingView)
        
        //1
        /*
         First, we need to create an array of AudioItem because we will be passing in this array to our audioPlayer to loop through and play. We also set our audioPlayer‘s delegate.
         */
        var playlist = [AudioItem]()
        audioPlayer.delegate = self
        
        //2
        /*
         2-3
         Next, we validate that we have a valid URL. Based on the count that was set in step 2, we create a new AudioItem object and add it into an array. After the loop, we call playMusic with the play list. The AVPlayer will handle all the playing processes. As you can see, what you need is to prepare the list of audio objects.
 */
        if let filename = musicFilePath, let url = URL(string: filename) {
            for _ in 0..<repeaterView.currentCount {
                let item = AudioItem(highQualitySoundURL: nil, mediumQualitySoundURL: url, lowQualitySoundURL: nil)
                playlist.append(item!)
            }
            playMusic(playlist)
        }
    }
    
    //3
    func playMusic(_ playlist: [AudioItem]) {
        audioPlayer.play(items: playlist)
    }
    
    fileprivate func restart() {
        /*
         As we are adding our views in our Step2 and Step3 functions, we should call removeFromSuperview() instead of hiding it.
 */
        uploadView.isHidden = false
        repeaterView.removeFromSuperview()
        playingView.removeFromSuperview()
        
        //4
        audioPlayer.stop()
    }
}

extension MRHomeViewController: UploadViewDelegate {
    func didTapUploadFile() {
        //1
        /*
         Here we initialised a new NSOpenPanel object. We then call its begin method which is a superclass method from NSSavePanel. This will present a modal view of our system file panel to load in a .mp3 file
 */
        let panel = NSOpenPanel()
        /*
         Because we will be calling self here, it is recommend to use weak or unowned here to prevent Strong Reference Cycle.
 */
        panel.begin { [weak self] (response) in
            // 2
            /*
             The response parameter of the closure is an enum of NSApplication.ModalResponse. We used a guard statement to handle the response and verify if the .mp3 file is valid.
 */
            guard response == NSApplication.ModalResponse.OK, let document = panel.urls.first, document.absoluteString.contains(".mp3") else {
                print("Invalid MP3 File!")
                return
            }
            
            //            print("Valid mp3 file!")
            // ? -> weak self
            self?.musicFilePath = document.absoluteString
            self?.showStep2()
        }
    }
}

extension MRHomeViewController: MRRepeaterViewDelegate {
    func didTapNext() {
        showStep3()
    }
}

extension MRHomeViewController: MRPlayingViewDelegate {
    func didTapRestart() {
        restart()
    }
}

//5
extension MRHomeViewController: AudioPlayerDelegate {
    func audioPlayer(_ audioPlayer: AudioPlayer, didChangeStateFrom from: AudioPlayerState, to state: AudioPlayerState) {
        if state == .stopped {
            playingView.staticLabel.stringValue = "Stopped"
        }
    }
}
