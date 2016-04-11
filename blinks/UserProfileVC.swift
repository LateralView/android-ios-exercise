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

    var username                : String!
    
    private var displayMode     : DisplayMode = .Posts
    {
        didSet
        {
            self.loadContent()
        }
    }
    
    private var comments        = [Comment]()
    private var threads         = [Thread]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loadUserData()
        self.loadContent()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "toComments"
        {
            let cell = sender as! ThreadCell
            let vc = segue.destinationViewController as! CommentsVC
            vc.thread = cell.thread
        }
    }
    
    // MARK: Private
    
    private func loadUserData()
    {
        self.userName.text = ""
        self.userPosts.text = ""
        self.userComments.text = ""
        
        BlinksSDK.instance.users.find(self.username) { (users) in
            
            if let user = users?.first
            {
                self.userName.text = user.username
                self.userPosts.text = "\(user.postCount) posts"
                self.userComments.text = "\(user.commentCount) comments"
            }
        }
    }
    
    private func loadContent()
    {
        self.comments = [Comment]()
        self.threads = [Thread]()
        self.tableView.reloadData()

        switch self.displayMode
        {
            
        case .Posts:
         
            BlinksSDK.instance.threads.find(username,
                                            handler: { (threads) in
                if let uThreads = threads
                {
                    self.threads = uThreads
                    self.tableView.reloadData()
                }
            })
            
        case .Comments:

            BlinksSDK.instance.comments.find(nil,
                                             username: username,
                                             handler: { (comments) in
                                                        
                if let uComments = comments
                {
                    self.comments = uComments
                    self.tableView.reloadData()
                }
            })
            
        }
    }
    
    // MARK: IBActions
    
    @IBAction func doDisplayPosts(sender: AnyObject)
    {
        self.displayMode = .Posts
    }
    
    @IBAction func doDisplayComments(sender: AnyObject)
    {
        self.displayMode = .Comments
    }

    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch self.displayMode
        {
        case .Posts:
            return self.threads.count
            
        case .Comments:
            return self.comments.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        switch self.displayMode
        {
        case .Posts:
            let cell = tableView.dequeueReusableCellWithIdentifier("ThreadCell", forIndexPath: indexPath) as! ThreadCell
            cell.thread = self.threads[indexPath.row]
            return cell
            
        case .Comments:
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentCell
            cell.comment = self.comments[indexPath.row]
            return cell

        }
    }

}
