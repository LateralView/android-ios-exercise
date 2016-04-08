//
//  SignUpVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/8/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController
{
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func doSignUp(sender: AnyObject)
    {
        if let validationError = self.validate()
        {
            let alert = UIAlertController(title: "Sign Up Error",
                                          message: validationError,
                                          preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let user = User(username: self.name.text!,
                        password: self.password.text!)
        
        BlinksSDK.instance.auth.signUp(user) { (success) in
            
            if success {
                self.navigationController?.popViewControllerAnimated(false)
            }
        }
        
        
    }
    
    private func validate() -> String?
    {
        guard self.name.text?.characters.count > 0 else {
            return "Please enter a username"
        }
        
        guard self.password.text?.characters.count > 0 else {
            return "Please enter your password"
        }

        guard self.confirmPassword.text?.characters.count > 0 else {
            return "Please re-enter your password"
        }

        guard self.password.text == self.confirmPassword.text else {
            return "Your password and password confirmation do not match."
        }

        return nil
    }
    
}