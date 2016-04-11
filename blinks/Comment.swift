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
    
    var id          : String?
    let threadId    : String
    let username    : String
    let text        : String
    var parentId    : String?
    var createdAt   : NSDate?
    var replyCount  : Int       = 0
    
    init(threadId: String,
         username: String,
         text:String)
    {
        self.threadId = threadId
        self.username = username
        self.text = text
    }
    
}