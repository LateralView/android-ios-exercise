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
    
    let id      : String
    let url     : String
    let title   : String
    
    init(id: String, url: String, title: String)
    {
        self.id = id
        self.url = url
        self.title = title
    }
    
}