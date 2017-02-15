//
//  TableViewCell.swift
//  UITableViewExample
//
//  Created by Jason Liang on 2/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var imageView2: UIImageView!
  @IBOutlet weak var imageView1: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
