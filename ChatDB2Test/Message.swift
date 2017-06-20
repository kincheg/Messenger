//
//  Message.swift
//  DB2LimitedTest
//
//  Created by kin on 10.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import UIKit
import Alamofire
import JSQMessagesViewController

class Message: JSQMessage {
    
    var userName: String!
    var userImageURL =  "https://placeimg.com/400/400/people"
    var userImage: UIImage!
    var textMessage: String!
    var createDate: String!
    var firstName: String!
    var lastName: String!
    
    func downloadUserImage(completed: @escaping DownloadComplete) {
        request(self.userImageURL).responseData { (response) in
            if let data = response.result.value {
                if let image = UIImage(data: data) {
                    self.userImage = image
                }
            }
            
            completed()
        }
    }
    
    
    
}
