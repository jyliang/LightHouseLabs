//
//  ViewController.swift
//  BreakPointsTourSwift
//
//  Created by steve on 2016-05-30.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goButton: UIBarButtonItem!
    
    let num = 10

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // deliberate crash to show how to crash on throw using breakpoint navigator
    
    @IBAction func goTapped(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

