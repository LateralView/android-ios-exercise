//
//  Thread.swift
//  blinks
//
//  Created by Leandro Tami on 3/30/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

class Thread
{
    
    let id              : String
    let URL             : NSURL
    let title           : String
    let createdAt       : NSDate
    let username        : String
    let commentCount    : Int
    
    init(id: String,
         URL: NSURL,
         title: String,
         createdAt: NSDate,
         username: String,
         commentCount: Int)
    {
        self.id = id
        self.URL = URL
        self.title = title
        self.createdAt = createdAt
        self.username = username
        self.commentCount = commentCount
    }
    
}