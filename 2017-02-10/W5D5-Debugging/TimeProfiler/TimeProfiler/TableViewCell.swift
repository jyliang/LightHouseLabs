//
//  TableViewCell.swift
//  TimeProfiler
//
//  Created by steve on 2016-05-29.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var data:Data? {
        didSet {
            label.text = data?.string
            imgView.image = data?.img
        }
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
}
