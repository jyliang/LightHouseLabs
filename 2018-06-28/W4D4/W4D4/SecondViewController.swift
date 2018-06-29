//
//  SecondViewController.swift
//  W4D4
//
//  Created by Jason Liang on 6/28/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let realm = try! Realm()
    let puppies = realm.objects(Dog.self).filter("age < 2")
    print(puppies)
    
    
//    DispatchQueue.main.async {
//
//    }
    DispatchQueue(label: "background").async {
      autoreleasepool {
        let realm = try! Realm()
        let theDog = realm.objects(Dog.self).filter("age == 1").first
        if theDog != nil {
          try! realm.write {
            theDog!.age = 3
          }
        }
      }
    }

    createPerson()
  }

  
  func createPerson() {
    let realm = try! Realm()
    var person = realm.objects(Person.self).first
    if (person == nil) {
      person = Person()
      person?.name = "Jason"
      if let person = person {
        try! realm.write {
          realm.add(person)
        }
      }
    }
    guard let personObj = person else {
      return
    }
    
    if (personObj.dogs.count == 0) {
      let dogs = realm.objects(Dog.self)
      try! realm.write {
        for dog in dogs {
          personObj.dogs.append(dog)
        }
      }

    }
  }

  @IBAction func addDog(_ sender: Any) {
    guard let name = nameTextField.text else {
      return
    }
    
    guard
      let ageText = ageTextField.text,
      let age = Int(ageText) else {
      return
    }
    
    let dog = Dog()
    dog.name = name
    dog.age = age
    
    let realm = try! Realm()
    
    try! realm.write {
      realm.add(dog)
    }
    
    nameTextField.text = ""
    ageTextField.text = ""
    
  }
  
}

