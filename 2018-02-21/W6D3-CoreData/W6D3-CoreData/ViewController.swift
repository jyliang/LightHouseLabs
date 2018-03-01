//
//  ViewController.swift
//  W6D3-CoreData
//
//  Created by Jason Liang on 2/21/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var personArray : [Person] = []
    var context : NSManagedObjectContext!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchPerson()
    }
    
    func fetchPerson() {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        let alphabetSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [alphabetSort]
        do {
            let personArray = try self.context.fetch(fetchRequest)
            self.personArray = personArray
            self.tableView.reloadData()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    @IBAction func saveTapped() {
        // managedObjectContext
        // we already have this.
        
        // create our object
        guard let text = self.textField.text, text.count > 0 else {
            return
        }
        
        let person = Person(context: context)
        person.name = self.textField.text
        
        // save our object
        try? context.save()
        self.textField.text = ""
        fetchPerson()
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = person.name
        return cell
    }
}

