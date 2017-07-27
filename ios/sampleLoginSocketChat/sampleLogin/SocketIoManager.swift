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
        socket.on("sendRoomList") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post(name: Notification.Name("sendRoomListNotification"), object: dataArray[0] as? [[String: AnyObject]])
        }
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func connectToServerWithRoomname(_ roomname:String, completionHandler: @escaping(_ roomList:[[String:AnyObject]]?) -> Void)
    {
        socket.emit("connectRoom", roomname)
        socket.on("roomList")
        {
            (dataArray, ack) -> Void in
            completionHandler(dataArray[0] as? [[String: AnyObject]])
        }
    }
}
