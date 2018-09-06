//
//  NotificationName.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let StartPlaying = Notification.Name("com.rhino.cocoaswift.StartPlaying")
    static let StopPlaying = Notification.Name("com.rhino.cocoaswift.StopPlaying")
    static let PausePlaying = Notification.Name("com.rhino.cocoaswift.PausePlaying")
    static let NextSong = Notification.Name("com.rhino.cocoaswift.NextSong")
    static let PreviousSong = Notification.Name("com.rhino.cocoaswift.PreviousSong")
    static let ChangeSong = Notification.Name("com.rhino.cocoaswift.ChangeSong")
    static let SwitchPlayList = Notification.Name("com.rhino.cocoaswift.SwitchPlayList")

}
