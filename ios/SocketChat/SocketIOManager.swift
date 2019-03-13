//
//  SocketIOManager.swift
//  SocketChat
//
//  Created by cord7894 on 2017. 7. 20..
//  Copyright © 2017년 AppCoda. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: "http://192.168.0.3:3000")!)
    
    override init() {
        super.init()
    }
    
    func establishConnection(){
        socket.connect()
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func connectToServerWithNickname(_ nickname: String, completionHandler: @escaping (_ userList: [[String: AnyObject]]?) -> Void) {
        socket.emit("connectUser", nickname)
        
        socket.on("userList") {(dataArray, ack) -> Void in
            completionHandler(dataArray[0] as? [[String: AnyObject]])
        }
        listenForOtherMessages()
    }
    
    func exitChatWithNickName(_ nickname:String, completionHandler: @escaping () -> Void){
        socket.emit("exitUser", nickname)
        completionHandler()
    }
    
    func sendMessage(message: String, withNickName nickname: String){
        socket.emit("chatMessage", nickname, message)
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
    
    func sendStartTypingMessage(nickname: String) {
        socket.emit("startType", nickname)
    }
    
    func sendStopTypingMessage(nickname: String) {
        socket.emit("stopType", nickname)
    }
}
