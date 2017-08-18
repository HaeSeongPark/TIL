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
    var socket = SocketIOClient(socketURL:URL(string:"http://192.168.40.62:3000")!)
    
    override init(){
        super.init()
    }
    
    func establishConnection(){
        socket.connect()
    }
    func closeConnection(){
        socket.disconnect()
    }
    
    func askRoomListReset(){
        socket.emit("askRoomListReset")
        socket.on("replyRoomListReset") { (dataArray, ack) -> Void in
            var roomsUsers = [String:AnyObject]()
            if dataArray.count == 2{
                roomsUsers["rooms"] = dataArray[0] as AnyObject
                roomsUsers["users"] = dataArray[1] as AnyObject
            }
            NotificationCenter.default.post(name: Notification.Name("replyRoomListResetNotification"), object:roomsUsers)
        }
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
    
    func exitChatWithNickName(_ nickname:String, roomTitle:String, completionHandler: @escaping () -> Void){
        socket.emit("exitUser", nickname, roomTitle)
        completionHandler()
    }
    
    func sendMessage(message: String, withNickName nickname: String, withRoomTitle roomTitle:String){
        socket.emit("chatMessage", nickname, message, roomTitle)
    }
    
    func getChatMessage(_ completionHandler: @escaping (_ messageInfo: [String: AnyObject]) -> Void) {
        socket.on("newChatMessage") { (dataArray, socketAck) -> Void in
            var messageDictionary = [String: AnyObject]()
            messageDictionary["nickname"] = dataArray[0] as AnyObject
            messageDictionary["message"] = dataArray[1] as AnyObject
            messageDictionary["date"] = dataArray[2] as AnyObject
            
            completionHandler(messageDictionary)
        }
    }
    
    func getNickName(roomTitle:String,  completionHandler: @escaping (_ nickName: String ) -> Void) {
        print("SocketIoManager - getNickName")
        socket.emit("askNickName", roomTitle)
        socket.on("sendNickName") { (dataArray, socketAck) -> Void in
            let userNickName = dataArray[0] as! String
            completionHandler(userNickName)
            print("SocketIoManager - sendNicName")
        }
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
    
    func sendStartTypingMessage(nickname: String, roomName:String) {
        socket.emit("startType", nickname)
    }
    
    func sendStopTypingMessage(nickname: String, roomName:String) {
        socket.emit("stopType", nickname)
    }
}
