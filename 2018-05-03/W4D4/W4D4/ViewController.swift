//
//  ViewController.swift
//  W4D4
//
//  Created by Jason Liang on 5/3/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
import AudioKit
import RealmSwift

// Define your models like regular Swift classes
class Dog: Object {
    // Optional String, Date, Data properties built in
    @objc dynamic var name: String? // set to nil automatically
    // RealmOptional properties used to make other types optional.
    // Should always be declared with `let`.
    // No @objc dynamic
    let age = RealmOptional<Int>()
}

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>() // models a one to many relationship
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let dog = createDog(with: "coco")
//        dog.age.value = 1
//
//        let person = createPerson(with: "Jason", and: nil)
//        person.dogs.append(dog)
//
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(person)
//        }
        
        basicFetch()
        fetchWithFilter()
        
        
        let realm = try! Realm()
        try! realm.write {
            guard let dog = fetchWithFilter() else { return }
            dog.age.value = (dog.age.value ?? 0) + 1
        }
        
        
//        deleteObject()
        deleteAllPeople()
        basicFetch()
    }
    
    
    
    private func deleteObject() {
        let realm = try! Realm()
        guard let dog = fetchWithFilter() else { return }
        try! realm.write {
            realm.delete(dog)
        }
    }
    
    private func deleteAllPeople() {
        let realm = try! Realm()
        // Pass the `Results` directly to delete everything fetched.
        try! realm.write {
            realm.delete(realm.objects(Person.self))
        }
    }
    
    private func basicFetch() {
        let realm = try! Realm()
        let results = realm.objects(Person.self)
        // loop through result set
        for person in results {
            print(#line, person.name)
            print(#line, person.dogs.first?.age.value ?? "no dog or no name")
        }
    }
    
//    private func fetchWithFilter() {
//        let realm = try! Realm()
//        let predicate = NSPredicate(format:"age > 0")
//        let results = realm.objects(Dog.self).filter(predicate)
//        for dog in results {
//            print(#line, dog.name ?? "no name set")
//        }
//    }

    private func fetchWithFilter()-> Dog? {
        let realm = try! Realm()
        let predicate = NSPredicate(format:"age > 0")
        let results = realm.objects(Dog.self).filter(predicate)
        return results.first
    }
    
    private func createDog(with name: String, and age: Int? = nil)-> Dog {
        let dog = Dog()
        dog.name = name
        dog.age.value = age
        return dog
    }
    
    private func createPerson(with name: String, and image: UIImage? = nil)-> Person {
        let person = Person()
        person.name = name
        if let image = image {
            person.picture = UIImageJPEGRepresentation(image, 1.0)
        }
        return person
    }


}

