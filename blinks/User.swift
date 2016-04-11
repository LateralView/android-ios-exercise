//
//  User.swift
//  blinks
//
//  Created by Leandro Tami on 3/30/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation
import CryptoSwift

class User
{
    
    let username                        : String
    var createdAt                       : NSDate    = NSDate()
    var postCount                       : Int       = 0
    var commentCount                    : Int       = 0

    // The following passwordHash and passwordSeed properties would normally
    // be stored in the backend and they would be unknown to any client app.
    // Since we're testing with JSON Server, which does not allow any kind of
    // server-side logic, we had to implement this here.

    private (set) var passwordHash      : String    = ""
    private (set) var passwordSeed      : Int       = 0
    
    init(username: String)
    {
        self.username = username
    }

    init(username: String, password: String)
    {        
        let seed : Int = Int(arc4random_uniform(UINT32_MAX))
        let unhashedStr = "\(seed)\(password)\(seed)"
        let hash = unhashedStr.sha256()
        
        self.username = username
        self.passwordSeed = seed
        self.passwordHash = hash
    }

    init(username: String, passwordHash: String, passwordSeed: Int)
    {
        self.username = username
        self.passwordSeed = passwordSeed
        self.passwordHash = passwordHash
    }

    func isPasswordEqual(password: String) -> Bool
    {
        let unhashedStr = "\(self.passwordSeed)\(password)\(self.passwordSeed)"
        let hash = unhashedStr.sha256()
        return self.passwordHash == hash
    }

}