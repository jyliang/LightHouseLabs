//
//  ItemView.swift
//  W7D4
//
//  Created by Jason Liang on 3/1/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit

@objc protocol ItemViewDelegate {
    func removeItem(itemView:UIView)
}

class ItemView: UIView {
    weak var delegate : ItemViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadButton() {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(removeSelf), for:.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.addSubview(button)
        button.backgroundColor = UIColor.lightGray
    }
    
    @objc func removeSelf() {
        self.delegate?.removeItem(itemView: self)
    }
}
