//
//  BlinksThreadsSDK.swift
//  blinks
//
//  Created by Leandro Tami on 4/11/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation
import Alamofire

class BlinksThreadsSDK
{
    func find(username: String? = nil,
              handler:(threads: [Thread]?) -> Void)
    {
        let URLString = "\(BlinksSDK.baseURL())/threads"
        var arguments = [String: String]()
        
        if let uUserName = username
        {
            arguments["username"] = uUserName
        }
        
        let request = Alamofire.request(.GET,
                                        URLString,
                                        parameters: arguments,
                                        encoding: .URL,
                                        headers: nil)
        request.responseJSON { (response) -> Void in
            
            if let result = response.result.value as! [[String: AnyObject]]?
                where response.response?.statusCode == 200
            {
                var threads = [Thread]()
                for item in result {
                    if let thread = Thread.deserialize(item) {
                        threads.append(thread)
                    }
                }
                handler(threads: threads)
            } else {
                handler(threads: nil)
            }
        }
    }
    
    func create(thread: Thread, handler:(success: Bool) -> Void )
    {
        let URLString = "\(BlinksSDK.baseURL())/threads"
        let arguments = thread.serialize()
        let request = Alamofire.request(.POST,
                                        URLString,
                                        parameters: arguments,
                                        encoding: .JSON,
                                        headers: nil)
        request.responseJSON { (response) -> Void in
            
            if response.response?.statusCode == 201
            {
                handler(success: true)
            } else {
                handler(success: false)
            }
        }
    }
    
}