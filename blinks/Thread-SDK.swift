//
//  Thread-SDK.swift
//  blinks
//
//  Created by Leandro Tami on 4/6/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

private struct Keys {
    static let id           = "id"
    static let url          = "url"
    static let title        = "title"
    static let createdAt    = "created_at"
    static let userName     = "username"
}

extension Thread
{
    
    static func deserialize(dictionary: [String: AnyObject]) -> Thread?
    {
        guard
            let id = dictionary[Keys.id] as! String?,
            let url = dictionary[Keys.url] as! String?,
            let title = dictionary[Keys.title] as! String?,
            let createdAt = dictionary[Keys.createdAt] as! String?,
            let username = dictionary[Keys.userName] as! String?
        else {
            return nil
        }

        return Thread(id: id,
                      url: url,
                      title: title,
                      createdAt: createdAt,
                      username: username
        )
    }
    
}