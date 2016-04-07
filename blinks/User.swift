//
//  User.swift
//  blinks
//
//  Created by Leandro Tami on 3/30/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

class User
{
    
    let username        : String
    var createdAt       : NSDate!
    var passwordHash    : String?
    var passwordSeed    : String?
    
    init(username: String)
    {
        self.username = username
    }
    
}