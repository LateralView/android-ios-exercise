//
//  CommentsVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/8/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var tableView: UITableView!
    @IBOutlet var sectionHeader: UIView!
    
    var thread      : Thread!
    
    private var comments    = [Comment]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        BlinksSDK.instance.comments.find(thread) { (comments) in
            
            if let uComments = comments
            {
                self.comments = uComments
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "toUserProfileFromThread"
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
        else if segue.identifier == "toUserProfileFromComment"
        {
            var cell = sender as! UIView
            while !cell.isKindOfClass(CommentCell)
            {
                cell = cell.superview!
            }
            let senderCell = cell as! CommentCell
            let vc = segue.destinationViewController as! UserProfileVC
            vc.username = senderCell.comment.username
        }

    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 1
        }
        else
        {
            return self.comments.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("ThreadCell", forIndexPath: indexPath) as! ThreadCell
            cell.thread = thread
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentCell
            cell.comment = self.comments[indexPath.row]
            return cell
        }
        
    }

    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 1
        {
            return self.sectionHeader.frame.size.height
        }
        else
        {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if section == 1
        {
            return self.sectionHeader
        }
        else
        {
            return nil
        }
    }

}
