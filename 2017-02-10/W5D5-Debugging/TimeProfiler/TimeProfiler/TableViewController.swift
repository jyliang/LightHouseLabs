//
//  TableViewController.swift
//  TimeProfiler
//
//  Created by steve on 2016-05-29.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

struct Data {
  let img: UIImage?
  let string: String
}

class TableViewController: UITableViewController {
  
  // MARK: - Table view data source
  
  // var formatter: DateFormatter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //self.createDateFormatter()
  }
  
  func createDateFormatter()-> DateFormatter {
    let format = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd: HH:mm:ss", options: 0, locale: Locale.current)
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  
  // var cache:[Int:Data] = [:]
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
    
    let row = indexPath.row
//    
//    if cache[row] == nil {
      let imgName = String(row % 10 + 1)
      let img = UIImage(named: imgName)
      
      // let string = formatter?.string(from: Date())
      
      let dateAsString = self.createDateFormatter().string(from: Date())
      
      let data: Data? = Data(img: img, string: dateAsString)
//      cache[row] = data
//    }
//    
//    let data = cache[row]!
    cell.data = data
    
    return cell
  }
}



