//
//  ThreadCell.swift
//  blinks
//
//  Created by Leandro Tami on 4/6/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class ThreadCell: UITableViewCell
{
    @IBOutlet var title                 : UILabel!
    @IBOutlet weak var userImage        : UIImageView!
    @IBOutlet weak var userName         : UILabel!
    @IBOutlet weak var commentCount     : UILabel!
    @IBOutlet weak var commentText      : UILabel!
    
    var thread: Thread!
    {
        didSet
        {
            self.title.text = thread.title
            self.userName.text = thread.username
            self.commentCount.text = "\(thread.commentCount)"
        }
    }
    
    
}