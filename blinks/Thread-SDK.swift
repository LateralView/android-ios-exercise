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
    
    static private let dateFormat = "yyyy-MM-dd'T'HH:mm:ss'T'ZZZ"
    
    static func deserialize(dictionary: [String: AnyObject]) -> Thread?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        guard
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

        let thread = Thread(URL: URL,
                            title: title,
                            username: username)
        thread.createdAt = createdAt
        thread.commentCount = commentCount
        
        if let id = dictionary[Keys.id] as! String? {
            thread.id = id
        }
        
        return thread
    }
    
    func serialize() -> [String: AnyObject]
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = Thread.dateFormat
        var result = [String: AnyObject]()
        if let id = self.id {
            result[Keys.id] = id
        }
        result[Keys.url] = self.URL.absoluteString
        result[Keys.title] = self.title
        result[Keys.createdAt] = dateFormatter.stringFromDate(self.createdAt)
        result[Keys.userName] = self.username
        result[Keys.commentCount] = self.commentCount
        return result
    }
    
}