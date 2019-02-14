//
//  ViewController.swift
//  W6D3-Storage-Demo
//
//  Created by Jason Liang on 2019-02-13.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

import UIKit

struct Constants {
    static let udKey = "com.example.text"
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldUD: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveTapped() {
        guard let text = textField.text else { return }
        let data = text.data(using: String.Encoding.utf8)
        guard let path =
            NSSearchPathForDirectoriesInDomains(
                .documentDirectory,
                .userDomainMask,
                true).first
            else { return }
        let filePath = "\(path)/example.txt"
        //1. data object method
//        try! data?.write(to: URL.init(fileURLWithPath: filePath))
        //2. file manager
        FileManager.default.createFile(atPath: filePath, contents: data, attributes: nil)
        
    }
    
    @IBAction func loadTapped() {
        guard let path =
            NSSearchPathForDirectoriesInDomains(
                .documentDirectory,
                .userDomainMask,
                true).first
            else { return }
        let filePath = "\(path)/example.txt"
        if let data = FileManager.default.contents(atPath: filePath) {
            let text = String.init(data: data, encoding: .utf8)
            textField.text = text
        }
        
        
    }
    
    @IBAction func saveTappedUD() {
        guard let text = textField.text else { return }
        let ud = UserDefaults.standard
        ud.set(textFieldUD.text, forKey: Constants.udKey)
        
    }
    
    @IBAction func loadTappedUD() {
        let ud = UserDefaults.standard
        if let text = ud.string(forKey: Constants.udKey) {
            textFieldUD.text = text
        }
        
    }
}

