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
    static let baseURL    = "http://localhost:3000/"
    static let instance   = BlinksSDK()
    
    let comments             = BlinksCommentsSDK()
    
    var currentUser: User?
    var isLoggedIn: Bool {
        return currentUser != nil
    }
    
    private init() {
    }
}