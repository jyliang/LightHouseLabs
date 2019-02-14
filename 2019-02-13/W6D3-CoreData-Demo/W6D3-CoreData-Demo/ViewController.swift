//
//  ViewController.swift
//  W6D3-CoreData-Demo
//
//  Created by Jason Liang on 2019-02-13.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var viewContext: NSManagedObjectContext!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var todos : [Todo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func saveContext() {
        let context = viewContext!
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    @IBAction func saveTapped() {
        guard let text = textField.text else { return }
        let todo = Todo(context: viewContext)
        todo.title = text
        saveContext()
        loadData()
    }
    
    func loadData() {
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")
        todos = try! viewContext.fetch(fetchRequest)
        tableView.reloadData()
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let item = todos[indexPath.item]
        cell?.textLabel?.text = item.title
        return cell!
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = todos[indexPath.item]
        
        item.title = "updated"
        saveContext()
        
//        viewContext.delete(item)
        loadData()
    }
}

