//
//  ViewController.swift
//  W8D4-Firebase
//
//  Created by Jason Liang on 5/31/18.
//  Copyright © 2018 Jason Liang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

  var ref : DatabaseReference!
  var entriesRef : DatabaseReference!
  var entries : [String:String] = [:]
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    // Creating database reference
    ref = Database.database().reference()
    entriesRef = Database.database().reference().child("entries")
    
    entriesRef.observe(.value) { (snapshot) in
      guard let results = snapshot.value as? [String:String] else { return }
      print(results)
      self.entries = results
      self.tableView.reloadData()
    }
  }

  @IBAction func addTapped() {
    if let text = textField.text, text.count > 0 {
      let generatedRef = ref.child("entries").childByAutoId()
      //alt:
//      let generatedRef = ref.child("entries").child("\(Date().timeIntervalSinceReferenceDate)")
      generatedRef.setValue(text)
    }
  }
}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return entries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let keys = Array(entries.keys)
    let key = keys[indexPath.item]
    let value = entries[key]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = value
    return cell
  }
}

