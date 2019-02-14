//
//  ViewController.swift
//  W6D3-Storage
//
//  Created by Jason Liang on 2019-02-13.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

import UIKit

struct Constants {
    static let udKey = "example.TEST"
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldUD: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveTapped() {
        //save via file manager
        let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        guard let text = textField.text else { return }
        let data = text.data(using: String.Encoding.utf8)
        let path = "\(directory.first!)/example.txt"
        //1. data write
        try! data?.write(to: URL.init(fileURLWithPath: path))
        
        //2. Use file manager
        FileManager.default.createFile(atPath: path, contents: data, attributes: nil)
    }
    
    @IBAction func loadTapped() {
        let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = "\(directory.first!)/example.txt"
        guard let data = FileManager.default.contents(atPath: path) else { return }
        let text = String.init(data: data, encoding: String.Encoding.utf8)
        textField.text = text
    }
    
    @IBAction func saveUDTapped() {
        guard let text = textFieldUD.text else { return }
        let ud = UserDefaults.standard
        ud.set(text, forKey: Constants.udKey)
    }
    
    @IBAction func loadUDTapped() {
        let ud = UserDefaults.standard
        guard let text = ud.string(forKey: Constants.udKey) else { return }
//        ud.object(forKey: Constants.udKey)
        textFieldUD.text = text
    }
    
    
}

