//
//  ViewController.swift
//  W6D3-CoreData
//
//  Created by Jason Liang on 2019-02-13.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context : NSManagedObjectContext!
    var persons : [Person]!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        persons = []
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        loadFromDatabase()
    }
    
    func loadFromDatabase() {
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        let people = try! context.fetch(fetchRequest)
        persons = people
        tableView.reloadData()
    }
    
    @IBAction func save() {
        guard let text = textField.text else {
            return
        }
        createObjects(name: text)
    }
    
    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createObjects(name:String) {
        //get context
        //C
        var person = Person(context: context)
        person.name = name
        saveContext()
        
        loadFromDatabase()
//
//        //R
//        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
//        let people = try! context.fetch(fetchRequest)
//
//
//        //U
//        person = people.first!
//        person.name = "jason"
//        saveContext()
//
//        //D
//        context.delete(person)
//        saveContext()
//
//        NSManagedObjectContext *context = [self getContext];
//        // creation
//        Todo *todoItem = [[Todo alloc] initWithContext:context];
//        todoItem.title = @"todo title";
//        todoItem.todoDescription = @"description";
//        todoItem.priority = 1;
//        todoItem.completed = false;
//        [context insertObject:todoItem];
//
//        [self saveContext];
//
//        // fetching
//        [self.fetchController performFetch:nil];
//        NSArray *objects = [self.fetchController fetchedObjects];
//
//        NSLog(@"%@", objects);
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let person = persons[indexPath.item]
        cell?.textLabel?.text = person.name
        if let cell = cell{
            return cell
        } else {
            return UITableViewCell.init()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.item]
        context.delete(person)
        loadFromDatabase()
    }
}

