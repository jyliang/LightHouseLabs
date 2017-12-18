//
//  DetailViewController.swift
//  FirebaseExample
//
//  Created by Jason Liang on 12/17/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetailViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  var entriesRef: DatabaseReference!
  var entries : [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.dataSource = self
    
    entriesRef = Database.database().reference().child("users")
    
    entriesRef.observe(DataEventType.value) { (snapshot) in
      guard let results = snapshot.value as? [String:String] else { return }
      DispatchQueue.main.async {
        self.entries = Array(results.values)
        self.tableView.reloadData()
      }
    }
    
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return entries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = entries[indexPath.row]
    return cell
  }
}
