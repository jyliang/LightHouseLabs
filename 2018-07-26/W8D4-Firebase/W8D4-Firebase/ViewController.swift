//
//  ViewController.swift
//  W8D4-Firebase
//
//  Created by Jason Liang on 7/26/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
// 1. Bring in database library
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  // 2. Declare a non-optional database references
  var ref : DatabaseReference!
  var entriesRef : DatabaseReference!
  var tableResults : [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    // 3. Create that database root reference
    ref = Database.database().reference()

    // a. Database entries ref
    entriesRef = ref.child("entries")
    // b. observer on the value change
    entriesRef.observe(DataEventType.value) { (snapshot) in
      guard let results = snapshot.value as? [String:[String:Any]] else { return }
      print(results)
      
      let keys = Array(results.keys)
      var r : [[String:Any]] = []
      for key in keys {
        r.append(results[key]!)
      }
      r.sort(by: { (entry1, entry2) -> Bool in
        guard
          let d1 = entry1["date"] as? NSNumber,
          let d2 = entry2["date"] as? NSNumber else {
            return false
        }
        return d1.doubleValue > d2.doubleValue
      })
      self.tableResults = r.map({ (obj) -> String in
        var result = ""
        if let value = obj["value"] as? String {
          result = value
        }
        return result
      })
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      
    }
  }
  
  @IBAction func addButtonTapped() {
    guard
      let text = textField.text,
      text.count > 0 else {
      return
    }
    
    // 4. Create a destination ref where values will be added to
    let generatedRef = ref.child("entries").childByAutoId()
    generatedRef.setValue(
      ["value":text,
       "date":Date().timeIntervalSince1970]
    )
    
    textField.text = ""
  }
  
  //MARK: UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.tableResults.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = self.tableResults[indexPath.row];
    return cell
  }

}

