//
//  ViewController.swift
//  W8D4-Firebase
//
//  Created by Jason Liang on 3/8/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    var ref : DatabaseReference!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Creating database reference
        ref = Database.database().reference()
    }
    
    @IBAction func addEntryTapped() {
        if let text = textField.text,
            text.count > 0 {
            addEntry(message: text)
        }
    }
    
    func addEntry(message:String) {
        let generatedRef = ref.child("entries").childByAutoId()
        generatedRef.description()
        generatedRef.setValue(message)
    }

}

