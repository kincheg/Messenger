//
//  ChatViewController.swift
//  DB2LimitedTest
//
//  Created by kin on 08.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var chatCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Chat"
        self.chatCollectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        
        ChatData.instance.downloadTopChats {
            for chat in ChatData.instance.chats {
                chat.downloadUserImage(completed: {
                    self.chatCollectionView.reloadData()
                })
            }
        }
        
        MessageData.instance.downloadMessageForChats {
            
        }
        
        
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChatData.instance.chats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ChatCell {
            
            let chat = ChatData.instance.chats[indexPath.row]
            cell.configureCell(chat: chat)
            
            return cell
            
        }else {
            
            return ChatCell()
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let chat = ChatData.instance.chats[indexPath.row]
        
        performSegue(withIdentifier: "showMessages", sender: chat)
    }
    
    
    //MARK: Segue
       
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMessages" {
            if let messagesVC = segue.destination as? MessagesViewController {
                if let chats = sender as? Chat {
                    messagesVC.chats = chats
                }
                
            }
        }
    }
    
}//class
