//
//  BlinksUsersSDK.swift
//  blinks
//
//  Created by Leandro Tami on 4/11/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation

import Alamofire

class BlinksUsersSDK
{
    
    func find(username: String? = nil,
              handler:(users: [User]?) -> Void)
    {
        let URLString = "\(BlinksSDK.baseURL())/users"
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
                var users = [User]()
                for item in result {
                    if let user = User.deserialize(item) {
                        users.append(user)
                    }
                }
                handler(users: users)
            } else {
                handler(users: nil)
            }
        }
    }
    
}