//
//  AddThreadVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/7/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class AddThreadVC: UITableViewController
{
    @IBOutlet weak var URL: UITextField!
    @IBOutlet weak var details: UITextView!
    
    @IBAction func doSavePost(sender: AnyObject)
    {
        if let validationError = self.validate()
        {
            let alert = UIAlertController(title: "Incomplete info",
                                          message: validationError,
                                          preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        if let URL = NSURL(string: self.URL.text!),
            let username = BlinksSDK.instance.currentUser?.username,
            let title = self.details.text
        {
            let thread = Thread(URL: URL, title: title, username: username)
            BlinksSDK.instance.threads.create(thread) { (success) in
                if success {
                    self.navigationController?.popViewControllerAnimated(true)
                }
            }
        }
    }
    
    private func validate() -> String?
    {
        guard self.URL.text?.characters.count > 0 else {
            return "Please enter an address"
        }
        
        guard NSURL(string: self.URL.text!) != nil else {
            return "The entered address is invalid"
        }
        
        guard self.details.text?.characters.count > 0 else {
            return "Please enter a description for this URL"
        }
        
        return nil
    }
    
}