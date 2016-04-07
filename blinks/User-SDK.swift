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
            let createdAtText = dictionary[Keys.createdAt] as! String?,
            let createdAt = dateFormatter.dateFromString(createdAtText)
        else {
            return nil
        }
        
        let user = User(username: username)
        user.createdAt = createdAt
        
        return user
    }
    
    
}