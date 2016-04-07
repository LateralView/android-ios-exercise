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
    static let commentCount = "comment_count"
}

extension Thread
{
    
    static func deserialize(dictionary: [String: AnyObject]) -> Thread?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'T'ZZZ"
        guard
            let id = dictionary[Keys.id] as! String?,
            let urlString = dictionary[Keys.url] as! String?,
            let URL = NSURL(string: urlString),
            let title = dictionary[Keys.title] as! String?,
            let createdAtText = dictionary[Keys.createdAt] as! String?,
            let createdAt = dateFormatter.dateFromString(createdAtText),
            let commentCount = dictionary[Keys.commentCount] as! Int?,
            let username = dictionary[Keys.userName] as! String?
        else {
            return nil
        }

        return Thread(id: id,
                      URL: URL,
                      title: title,
                      createdAt: createdAt,
                      username: username,
                      commentCount: commentCount
        )
    }
    
}