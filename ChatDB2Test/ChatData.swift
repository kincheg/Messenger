//
//  ChatData.swift
//  DB2LimitedTest
//
//  Created by kin on 08.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import Foundation
import Alamofire

class ChatData {
    static let instance = ChatData()
    
    var chats = [Chat]()
    
    var username = ""
    var userPhotoURL = ""
    var lastMessage = ""
    var createData = ""
    var firstName = ""
    var lastName = ""
    
    func downloadTopChats(completed: @escaping DownloadComplete) {
        
        let url = URLChatChannels
        
        request(url).responseJSON { (response) in
            //print(response)
            if let JSON = response.result.value as? [String : Any] {
                print("Got JSON")
                //print(JSON)
                if let channelsArray = JSON["channels"] as? [[String : Any]], channelsArray.count > 0 {
                    print("Got array of channels!!!")
                    
                    for i in 0..<channelsArray.count {
                        //print(channelsArray[i]["id"])
                        if let lastMessagesArray = channelsArray[i]["last_message"] as? [String : Any] {
                            //print(lastMessagesArray)
                            
                            if let message = lastMessagesArray["text"] as? String {
                                self.lastMessage = message
                                //print(self.lastMessage)
                            }
                            
                            
                            
                            if let senders = lastMessagesArray["sender"] as? [String : Any] {
                                //print(senders)
                                if let username = senders["username"] as? String {
                                    self.username = username
                                    //print(self.username)
                                }
                                if let photoURL = senders["photo"] as? String {
                                    self.userPhotoURL = photoURL
                                    //print(self.userPhotoURL)
                                }
                                if (lastMessagesArray["create_date"] as? String) != nil {
                                    let dates = Foundation.Date()
                                    let formatedDate = dates.dashedStringFromDate()
                                    self.createData = formatedDate
                                    //print(self.createData)
                                }
                                if let firstName = senders["first_name"] as? String {
                                    self.firstName = firstName
                                    //print(self.firstName)
                                }
                                if let lastName = senders["last_name"] as? String {
                                    self.lastName = lastName
                                    //print(self.lastName)
                                }
                                
                            }
                            let chat = Chat(name: self.username, imageURL: self.userPhotoURL, lastMessage: self.lastMessage, createDate: self.createData, firstName: self.firstName, lastName: self.lastName)
                            self.chats.append(chat)
                        }
                    }
                    
                    
                }
                
            }
            completed()
        }
    }
}

