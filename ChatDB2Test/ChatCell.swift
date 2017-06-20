//
//  ChatCell.swift
//  DB2LimitedTest
//
//  Created by kin on 08.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var createData: UILabel!
    @IBOutlet weak var firstName: UILabel!
     
    func configureCell(chat: Chat) {
        if chat.userImage != nil {
            userImageView.layer.cornerRadius = 30
            userImageView.layer.masksToBounds = true
            userImageView.image = chat.userImage
             
        }
        
        if chat.lastMessage != nil {
            lastMessage.text = chat.lastMessage
        }
        
        if chat.createDate != nil {
            createData.text = chat.createDate
        }
        if chat.firstName != nil {
            firstName.text = chat.firstName + chat.lastName
        }
    }
    
}
