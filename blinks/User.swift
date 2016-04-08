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
    
    let username                        : String
    var createdAt                       : NSDate    = NSDate()
    private (set) var passwordHash      : String    = ""
    private (set) var passwordSeed      : Int       = 0
    
    init(username: String)
    {
        self.username = username
    }

    init(username: String, password: String)
    {
        self.username = username
        self.passwordSeed = 0
        self.passwordHash = password
    }

    init(username: String, passwordHash: String, passwordSeed: Int)
    {
        self.username = username
        self.passwordSeed = passwordSeed
        self.passwordHash = passwordHash
    }

    func isPasswordEqual(password: String) -> Bool
    {
        return self.passwordHash == password
    }

}