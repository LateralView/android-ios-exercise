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
        
        BlinksSDK.instance.comments.findAllThreads { (threads) in
            if let uThreads = threads {
                self.threads = uThreads
                self.tableView.reloadData()
            }
        }
        
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
