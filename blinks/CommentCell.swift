//
//  CommentCell.swift
//  blinks
//
//  Created by Leandro Tami on 4/11/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell
{
    @IBOutlet var title                 : UILabel!
    @IBOutlet weak var userImage        : UIImageView?
    @IBOutlet weak var userName         : UILabel?
    @IBOutlet weak var commentCount     : UILabel?
    @IBOutlet weak var commentText      : UILabel?
    
    var comment: Comment!
    {
        didSet
        {
            self.commentText?.text = comment.text
            self.userName?.text = comment.username
            self.commentCount?.text = "\(comment.replyCount)"
        }
    }
    
    
}