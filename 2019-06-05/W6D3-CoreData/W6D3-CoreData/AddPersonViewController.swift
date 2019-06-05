//
//  AddPersonViewController.swift
//  W6D3-CoreData
//
//  Created by Jason Liang on 2019-06-05.
//  Copyright © 2019 jasonliang. All rights reserved.
//

import UIKit
import CoreData

class AddPersonViewController: UIViewController {
  
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  
  private var appDelegate: AppDelegate? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
      self.appDelegate = appDelegate
    }
  }
  
  @IBAction func save() {
    guard let appDelegate = self.appDelegate else {
      return
    }
    let context = appDelegate.persistentContainer.viewContext
    
    if
      let name = nameTextField.text,
      let ageText = ageTextField.text,
      let age = Int16(ageText) {
      
      let person = Person(context: context)
      person.name = name
      person.age = age
      appDelegate.saveContext()
      self.dismiss(animated: true, completion: nil)
      
    } else {
      let alert = UIAlertController(title: "Error", message: "Double check your data", preferredStyle: UIAlertController.Style.alert)
      
      alert.addAction(UIAlertAction(title: "Yes Sir", style: .default, handler: nil))
      
      self.present(alert, animated: true)
    }
  }
  
  @IBAction func cancel() {
    self.dismiss(animated: true, completion: nil)
  }
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
