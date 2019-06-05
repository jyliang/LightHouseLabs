//
//  ViewController.swift
//  W6D3-Storage2
//
//  Created by Jason Liang on 2019-06-05.
//  Copyright © 2019 jasonliang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let key = "key"
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var textField2: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func saveData() {
    let ud = UserDefaults.standard
    if let text = textField.text {
      ud.set(text, forKey: key)
    } else {
      ud.removeObject(forKey: key)
    }
  }


  @IBAction func loadData() {
    let ud = UserDefaults.standard
    textField.text = ud.string(forKey: key)
  }
  
  func getExampleTextPath() -> String? {
    // 1. directory
    let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    guard let dir = directory.first else {
      return nil
    }
    // 2. create your file path
    let path = "\(dir)/example.txt"
    return path
  }
  
  @IBAction func saveData2() {
    guard let text = textField2.text else {
      return
    }
    guard let path = getExampleTextPath() else {
      return
    }
    // 3. a) Write with data method
    let data = text.data(using: String.Encoding.utf8)
//    try? data?.write(to: URL(fileURLWithPath: path))
    
    // 3. b) write with filemanager
    FileManager.default.createFile(atPath: path, contents: data, attributes: nil)
    
  }
  
  @IBAction func loadData2() {
    guard let path = getExampleTextPath() else {
      return
    }
    
    // a
//    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
    
    // b
    guard let data = FileManager.default.contents(atPath: path) else { return }
    
    guard let text = String(data: data, encoding: .utf8) else { return }
    textField2.text = text
    
  }
}

