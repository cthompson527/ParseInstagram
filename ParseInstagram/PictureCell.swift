//
//  PictureCell.swift
//  ParseInstagram
//
//  Created by Cory Thompson on 3/4/16.
//  Copyright © 2016 Cory Thompson. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PictureCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var posterView: PFImageView!
    var picture: PFObject! {
        didSet {
            self.captionLabel.text = picture["caption"] as? String
            self.posterView.file = picture["media"] as? PFFile
            self.posterView.loadInBackground()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
