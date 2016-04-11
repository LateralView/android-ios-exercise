//
//  ThreadListVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/6/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class ThreadListVC: UITableViewController
{
    var threads = [Thread]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        BlinksSDK.instance.threads.find { (threads) in
            if let uThreads = threads {
                self.threads = uThreads
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "toWebContent"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let thread = self.threads[indexPath.row]
                let vc = segue.destinationViewController as! WebContentVC
                vc.thread = thread
            }
        }
        else if segue.identifier == "toComments"
        {
            var cell = sender as! UIView
            while !cell.isKindOfClass(ThreadCell)
            {
                cell = cell.superview!
            }
            let senderCell = cell as! ThreadCell
            let vc = segue.destinationViewController as! CommentsVC
            vc.thread = senderCell.thread
        }
        else if segue.identifier == "toUserProfile"
        {
            var cell = sender as! UIView
            while !cell.isKindOfClass(ThreadCell)
            {
                cell = cell.superview!
            }
            let senderCell = cell as! ThreadCell
            let vc = segue.destinationViewController as! UserProfileVC
            vc.username = senderCell.thread.username
        }
        
    }
    
    // MARK: IBActions
    
    @IBAction func doSignOut(sender: AnyObject)
    {
        BlinksSDK.instance.currentUser = nil
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITableViewDataSource protocol
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.threads.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ThreadCell", forIndexPath: indexPath) as! ThreadCell
        cell.thread = self.threads[indexPath.row]
        return cell
    }
    
}
