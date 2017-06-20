//
//  MessageData.swift
//  DB2LimitedTest
//
//  Created by kin on 10.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import Foundation
import Alamofire

class MessageData {
    
    static let instance = MessageData()
    
    var message = [Message]()
    
    
    var username = ""
    var userPhotoURL = ""
    var textMessage = ""
    var createData = ""
    var firstName = ""
    var lastName = ""
    
    
    func downloadMessageForChats(completed: @escaping DownloadComplete) {
        
        let url = URLChatMessage
        
        request(url).responseJSON { (response) in
            //print(response)
            if let JSON = response.result.value as? [String : Any] {
                if let messagesArray = JSON["messages"] as? [[String : Any]], messagesArray.count > 0 {
                    //print(messagesArray)
                    
                    for i in 0..<messagesArray.count{
                        if let textMessage = messagesArray[i]["text"] as? String {
                            self.textMessage = textMessage
                            //print(textMessage)
                            
                            let message = Message(senderId: self.firstName, displayName: self.lastName, text: self.textMessage)
                            self.message.append(message!)
                            
                            
                        }
                    }
                    
                }
            }
            
            
        }
        completed()
    }
}
