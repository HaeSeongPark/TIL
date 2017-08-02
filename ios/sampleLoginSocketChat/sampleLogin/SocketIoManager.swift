//
//  SocketIoManager.swift
//  sampleLogin
//
//  Created by cord7894 on 2017. 7. 25..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import SocketIO

class SocketIoManager: NSObject {
    static let sharedInstance = SocketIoManager()
    
    var socket = SocketIOClient(socketURL:URL(string:"http://192.168.30.18:3000")!)
    
    override init(){
        super.init()
    }
    
    func establishConnection(){
        socket.connect()
        socket.on("sendRoomList") { (dataArray, ack) -> Void in
//            print(dataArray[0] as? [[String: AnyObject]])
            var roomsUsers = [String:AnyObject]()
            roomsUsers["rooms"] = dataArray[0] as AnyObject
            roomsUsers["users"] = dataArray[1] as AnyObject
            //            NotificationCenter.default.post(name: Notification.Name("sendRoomListNotification"), object: dataArray[0] as? [[String: AnyObject]])
            //        }
            NotificationCenter.default.post(name: Notification.Name("sendRoomListNotification"), object:roomsUsers)
        }
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func connectToServerWithRoomname(_ roomname:String, completionHandler: @escaping(_ roomsUsers:[String:AnyObject]?) -> Void)
    {
        socket.emit("connectRoom", roomname)
        socket.on("roomList")
        {
            (dataArray, ack) -> Void in
            var roomsUsers = [String:AnyObject]()
            roomsUsers["rooms"] = dataArray[0] as AnyObject
            roomsUsers["users"] = dataArray[1] as AnyObject
            completionHandler(roomsUsers)
        }
    }
    
    func connectToServerWithNickname(_ nickname: String, _ roomTitle:String, completionHandler: @escaping (_ userList: [[String: AnyObject]]?) -> Void) {
        socket.emit("connectUser", nickname, roomTitle)
        
        socket.on("userList") {(dataArray, ack) -> Void in
            completionHandler(dataArray[0] as? [[String: AnyObject]])
        }
        listenForOtherMessages()
    }
    
    private func listenForOtherMessages() {
        
        socket.on("userConnectUpdate") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post(name: Notification.Name("userWasConnectedNotification"), object: dataArray[0] as! [String: AnyObject])
        }
        
        socket.on("userExitUpdate") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post(name: Notification.Name("userWasDisconnectedNotification"), object: dataArray[0] as! String)
        }
        
        socket.on("userTypingUpdate") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post(name: Notification.Name("userTypingNotification"), object: dataArray[0] as? [String: AnyObject])
        }
    }
}
