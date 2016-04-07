//
//  BlinksAuthSDK.swift
//  blinks
//
//  Created by Leandro Tami on 4/7/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import Foundation
import Alamofire

class BlinksAuthSDK {
    
    func authenticate(username: String, password: String, handler:(user: User?) -> Void )
    {
        let URLString = "\(BlinksSDK.baseURL())/users"
        let arguments = [
            "username": username
        ]
        let request = Alamofire.request(.GET,
                                        URLString,
                                        parameters: arguments,
                                        encoding: .URL,
                                        headers: nil)
        request.responseJSON { (response) -> Void in
            
            if let result = response.result.value as! [[String: AnyObject]]?,
                let first = result.first,
                let user = User.deserialize(first)
                where response.response?.statusCode == 200
            {
                BlinksSDK.instance.currentUser = user
                handler(user: user)
            } else {
                handler(user: nil)
            }

        }
    }
    
}