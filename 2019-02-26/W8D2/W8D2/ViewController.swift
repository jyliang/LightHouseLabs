//
//  ViewController.swift
//  W8D2
//
//  Created by Jason Liang on 2019-02-26.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    - (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection NS_AVAILABLE_IOS(8_0);
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard let ptc = previousTraitCollection else {
            return
        }
        print("\(ptc.horizontalSizeClass.rawValue) + \(ptc.verticalSizeClass.rawValue)")
    }
}

