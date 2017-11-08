//
//  ViewController.swift
//  W2D1
//
//  Created by Jason Liang on 11/7/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = "Jason"
  }
  
  @IBAction func changeName(_ sender: Any) {
    self.titleLabel.text = "Liang"
  }
  
  @IBAction func importPhoto(_ sender: Any) {
    // init picker
    let picker = UIImagePickerController()
    // customize
    picker.delegate = self
    if TARGET_OS_SIMULATOR == 1 {
      picker.sourceType = .photoLibrary
    } else {
      picker.sourceType = .camera
      picker.cameraDevice = .front
      picker.cameraCaptureMode = .photo
    }
    // present the picker
    self.present(picker, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
      self.imageView.image = image
      
      picker.dismiss(animated: true, completion: nil)
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

