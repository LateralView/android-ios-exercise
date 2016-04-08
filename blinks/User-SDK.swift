//
//  User-SDK.swift
//  blinks
//
//  Created by Leandro Tami on 4/7/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

private struct Keys {
    static let userName         = "username"
    static let passwordHash     = "password_hash"
    static let passwordSeed     = "password_seed"
    static let createdAt        = "created_at"
}

extension User
{
    
    static private let dateFormat = "yyyy-MM-dd'T'HH:mm:ss'T'ZZZ"
    
    static func deserialize(dictionary: [String: AnyObject]) -> User?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        guard
            let username = dictionary[Keys.userName] as! String?,
            let passwordHash = dictionary[Keys.passwordHash] as! String?,
            let passwordSeed = dictionary[Keys.passwordSeed] as! Int?,
            let createdAtText = dictionary[Keys.createdAt] as! String?,
            let createdAt = dateFormatter.dateFromString(createdAtText)
        else {
            return nil
        }
        
        let user = User(username: username,
                        passwordHash: passwordHash,
                        passwordSeed: passwordSeed)
        user.createdAt = createdAt
        
        return user
    }
    
    func serialize() -> [String: AnyObject]
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = User.dateFormat
        var result = [String: AnyObject]()
        result[Keys.userName] = self.username
        result[Keys.passwordHash] = self.passwordHash
        result[Keys.passwordSeed] = self.passwordSeed
        result[Keys.createdAt] = dateFormatter.stringFromDate(self.createdAt)
        return result
    }
    
}