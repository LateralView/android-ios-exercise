//
//  Comment-SDK.swift
//  blinks
//
//  Created by Leandro Tami on 4/11/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

private struct Keys {
    static let id           = "id"
    static let thread       = "thread"
    static let userName     = "username"
    static let text         = "text"
    static let createdAt    = "created_at"
    static let parent       = "parent"
    static let replyCount   = "reply_count"
}

extension Comment
{
    
    static private let dateFormat = "yyyy-MM-dd'T'HH:mm:ss'T'ZZZ"
    
    static func deserialize(dictionary: [String: AnyObject]) -> Comment?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        guard
            let threadId = dictionary[Keys.thread] as! String?,
            let username = dictionary[Keys.userName] as! String?,
            let text = dictionary[Keys.text] as! String?,
            let createdAtText = dictionary[Keys.createdAt] as! String?,
            let createdAt = dateFormatter.dateFromString(createdAtText)
            else {
                return nil
        }
        
        let comment = Comment(threadId: threadId,
                              username: username,
                              text: text)
        comment.createdAt = createdAt
        comment.replyCount = 0
        comment.id = dictionary[Keys.id] as! String?
        comment.parentId = dictionary[Keys.parent] as! String?
        
        return comment
    }
    
//    func serialize() -> [String: AnyObject]
//    {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = Thread.dateFormat
//        var result = [String: AnyObject]()
//        if let id = self.id {
//            result[Keys.id] = id
//        }
//        result[Keys.url] = self.URL.absoluteString
//        result[Keys.title] = self.title
//        result[Keys.createdAt] = dateFormatter.stringFromDate(self.createdAt)
//        result[Keys.userName] = self.username
//        result[Keys.commentCount] = self.commentCount
//        return result
//    }
    
}