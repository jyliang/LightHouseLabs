//
//  ViewController.swift
//  DebuggingExerciseSwift
//
//  Created by steve on 2016-04-14.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var data: [String]!
    var bumString: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(bumString!)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        bumString = "Bum String, Why doesn't this work?"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let dataForRow = data[indexPath.row]
        cell.textLabel?.text = dataForRow
        cell.textLabel?.font = UIFont(name: dataForRow, size: 22.0)
        cell.textLabel?.textColor = UIColor.randomColor()
        return cell
    }
    
    //MARK: PrepareForSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailViewController" {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            
            let dataForRow = data[(indexPath?.row)!]
            
            let detailVieWController = segue.destination as! DetailViewController
            
            detailVieWController.label.text = dataForRow
            detailVieWController.label.font = UIFont(name: dataForRow, size: 22)
            detailVieWController.label.sizeToFit()
            detailVieWController.label.textColor = UIColor.randomColor()
        }
    }
    
    
    
}

