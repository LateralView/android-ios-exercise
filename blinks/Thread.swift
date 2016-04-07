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
    
    var id              : String?
    var URL             : NSURL
    var title           : String
    var createdAt       : NSDate
    var username        : String
    var commentCount    : Int
    
    init(URL: NSURL,
         title: String,
         username: String)
    {
        self.URL = URL
        self.title = title
        self.createdAt = NSDate()
        self.username = username
        self.commentCount = 0
    }
    
}