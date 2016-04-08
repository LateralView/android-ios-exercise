//
//  SignInVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/7/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class SignInVC: UIViewController
{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        if BlinksSDK.instance.isLoggedIn
        {
            self.performSegueWithIdentifier("toThreadList", sender: self)
        }
    }
    
    @IBAction func doSignIn(sender: AnyObject)
    {
        BlinksSDK.instance.auth.authenticate(userName.text!,
                                             password: password.text!)
        { (user) in
            
            if user != nil {
                self.performSegueWithIdentifier("toThreadList", sender: self)
            } else {
                let alert = UIAlertController(title: "Incorrect credentials",
                                              message: "Please verify you've entered the correct username and password, then try again.",
                                              preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
                                                
        }
    }
    
}
