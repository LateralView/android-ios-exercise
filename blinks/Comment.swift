//
//  Comment.swift
//  blinks
//
//  Created by Leandro Tami on 3/30/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

class Comment
{
    
    let id          : String
    let threadId    : String
    let username    : String
    let text        : String
    var parentId    : String?
    var createdAt   : String?
    
    init(id: String, threadId: String, username: String, text:String)
    {
        self.id = id
        self.threadId = threadId
        self.username = username
        self.text = text
    }
    
}