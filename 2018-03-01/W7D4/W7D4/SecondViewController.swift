//
//  SecondViewController.swift
//  W7D4
//
//  Created by Jason Liang on 3/1/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150)
        let item = ItemView(frame: frame)
        item.translatesAutoresizingMaskIntoConstraints = false
        item.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        item.heightAnchor.constraint(equalToConstant: 150).isActive = true
        stackView.addArrangedSubview(item)
        item.delegate = self
    }
}

extension SecondViewController : ItemViewDelegate {
    func removeItem(itemView: UIView) {
//        itemView.removeFromSuperview()
        itemView.isHidden = true
//        stackView.removeArrangedSubview(itemView)
    }
}

