//
//  BlinksSDK.swift
//  blinks
//
//  Created by Leandro Tami on 3/30/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

class BlinksSDK
{
    static let instance         = BlinksSDK()
    static let defaultBaseURL   = "http://localhost:3000"
    
    let auth                    = BlinksAuthSDK()
    let comments                = BlinksCommentsSDK()
    
    var currentUser: User?
    var isLoggedIn: Bool
    {
        return currentUser != nil
    }
    
    private init()
    {
    }

    static func baseURL() -> String
    {
        let env = NSProcessInfo.processInfo().environment
        if let url = env["BlinksHost"] {
            return url
        } else {
            return defaultBaseURL
        }
    }
    
}