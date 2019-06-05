//
//  PersonTableViewController.swift
//  W6D3-CoreData
//
//  Created by Jason Liang on 2019-06-05.
//  Copyright © 2019 jasonliang. All rights reserved.
//

import UIKit
import CoreData

class PersonTableViewController: UITableViewController {
  private var appDelegate: AppDelegate? = nil
  private var personResults : [Person] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
      self.appDelegate = appDelegate
    }
  }
  
  func loadData() {
    guard let appDelegate = self.appDelegate else {
      assertionFailure("Unable to retrieve app delegate")
      return
    }
    
    let request: NSFetchRequest<Person> = Person.fetchRequest()
    //    request.predicate = NSPredicate(format: "ANY name == %@", "Jason")
    let context = appDelegate.persistentContainer.viewContext
    
    if let results = try? context.fetch(request) {
      self.personResults = results
      self.tableView.reloadData()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.loadData()
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return personResults.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    let person = self.personResults[indexPath.item]
    cell.textLabel?.text = person.name
    
    return cell
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
