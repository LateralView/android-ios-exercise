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
    
    let id          : String
    let url         : String
    let title       : String
    let createdAt   : String
    let username    : String
    
    init(id: String,
         url: String,
         title: String,
         createdAt: String,
         username: String)
    {
        self.id = id
        self.url = url
        self.title = title
        self.createdAt = createdAt
        self.username = username
    }
    
}