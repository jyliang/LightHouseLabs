//
//  ViewController.swift
//  W4D1
//
//  Created by Jason Liang on 11/21/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
  var stations : [[String:Any]] = []
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.tableView)
    self.tableView.frame = self.view.bounds
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    self.tableView.dataSource = self
    retrieveBikeStationInfo()
  }

  //MARK: UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.stations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    let station = self.stations[indexPath.row]
    if let name = station["name"] as? String {
      cell?.textLabel?.text = name
    }
    return (cell != nil) ? cell! : UITableViewCell()
  }
  
  //MARK:
  
  func retrieveBikeStationInfo() {
    let session = URLSession.shared
    
    let urlString = "https://tor.publicbikesystem.net/ube/gbfs/v1/en/station_information"
    
    guard let url = URL(string: urlString) else {
      return
    }
    
    let task = session.dataTask(with: url) { (data, response, error) in
      print("i got something something back!")
      guard let data = data else { return }
      guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
      guard let stationInfoJson = json as? [String:Any] else { return }
      guard let stationsJson = stationInfoJson["data"] as? [String:Any] else { return }
      guard let stations = stationsJson["stations"] as? [[String:Any]] else { return }
      
      print(stations)
      self.stations = stations;
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
    
    task.resume()
  }

}












