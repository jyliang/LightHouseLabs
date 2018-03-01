//
//  ViewController.swift
//  W6D3-DataPersistence
//
//  Created by Jason Liang on 2/21/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var udTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveTapped() {
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let docPath = directories.first {
            let docUrl = URL(fileURLWithPath: docPath)
            print(docUrl)
            let fileUrl = docUrl.appendingPathComponent("text.txt")
            
            if let text = self.textField.text,
                text.count > 0,
                let data = text.data(using: .utf8) {
                try? data.write(to: fileUrl)
            }
            
        }
    }
    
    @IBAction func loadTapped() {
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let docPath = directories.first {
            let docUrl = URL(fileURLWithPath: docPath)
            print(docUrl)
            let fileUrl = docUrl.appendingPathComponent("text.txt")
            
            let fm = FileManager()
            if fm.fileExists(atPath: fileUrl.absoluteString, isDirectory: nil) {
                let data = try! Data(contentsOf: fileUrl)
            }
            
            if let data = try? Data(contentsOf: fileUrl),
                let text = String(data: data, encoding: .utf8) {
                self.textField.text = text
            }
            
        }
    }
    
    @IBAction func udSaveTapped() {
        if let text = self.udTextField.text {
            UserDefaults.standard.setValue(text, forKey: "udTextKey")
        }
        
    }
    
    @IBAction func udLoadTapped(_ sender: Any) {
        if let text = UserDefaults.standard.value(forKey: "udTextKey") as? String {
            self.udTextField.text = text
        }
    }
}

