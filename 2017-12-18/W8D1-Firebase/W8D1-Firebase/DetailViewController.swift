//
//  DetailViewController.swift
//  W8D1-Firebase
//
//  Created by Jason Liang on 12/18/17.
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
    
    observeUsers()
  }
  
  func observeUsers() {
    entriesRef = Database.database().reference().child("users")
    
    entriesRef.observe(DataEventType.value) {
      [weak self]
      (snapshot) in
      guard let `self` = self else { return }
      guard let results = snapshot.value as? [String:String] else { return }
      self.entries = Array(results.values)
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.entries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = self.entries[indexPath.row]
    return cell
  }
  
}
