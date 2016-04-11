//
//  UserProfileVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/11/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

private enum DisplayMode
{
    case Posts
    case Comments
}

class UserProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPosts: UILabel!
    @IBOutlet weak var userComments: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var thread          : Thread!
    
    private var displayMode     : DisplayMode = .Posts
    private var comments        = [Comment]()
    private var posts           = [Thread]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    private func loadData()
    {
        switch self.displayMode
        {
            
        case .Posts:
            
        case .Comments:

            BlinksSDK.instance.comments.findComments(thread) { (comments) in
                
                if let uComments = comments
                {
                    self.comments = uComments
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    // MARK: IBActions
    
    @IBAction func doDisplayPosts(sender: AnyObject)
    {
    }
    
    @IBAction func doDisplayComments(sender: AnyObject)
    {
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

}
