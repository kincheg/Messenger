//
//  Chat.swift
//  DB2LimitedTest
//
//  Created by kin on 08.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import UIKit
import Alamofire

class Chat {
    
    var userName: String!
    var userImageURL: String!
    var userImage: UIImage!
    var lastMessage: String!
    var createDate: String!
    var firstName: String!
    var lastName: String!
    
    init(name: String, imageURL: String, lastMessage: String!, createDate: String!, firstName: String!, lastName: String!) {
        self.userName = name
        self.userImageURL = imageURL
        self.lastMessage = lastMessage
        self.createDate = createDate
        self.firstName = firstName
        self.lastName = lastName
    }
    
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
