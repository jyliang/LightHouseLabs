//
//  ViewController.swift
//  W6D3-UIActivityViewController
//
//  Created by Jason Liang on 2/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var sharebutton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func sendInOptionalText(text:String?) {
//    guard let text = text else {
//      return
//    }

    if let text2 = text {
      iWantNotOptionalParam(text: text2)
    }
  }
  
  func sendInOptionalAny(any:Any?) {
    // Method 1: Guard
//    guard let text = any else { return }
//    guard let text2 = text as? String else { return }
    
    
    // Method 2: if let
    
//    if let text = any,
//      let text2 = text as? String {
//      iWantNotOptionalParam(text: text2)
//    }

    // Old way
//    if let text = any {
//      if let text2 = text as? String {
//        iWantNotOptionalParam(text: text2)
//      }
//    }
    
    
    
    
  }
  
  
  func iWantNotOptionalParam(text:String) {
  
  }
  
  @IBAction func shareTextButtonTapped(_ sender: Any) {

    // Explictily declare 'text' is a 'String' type
    let text : String = "text to share"
    
    let activityItems = [text]
    let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    // exclude some activity types from the list (optional)
    activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
    activityViewController.popoverPresentationController?.sourceView = self.sharebutton // so that iPads won't crash
    self.present(activityViewController, animated: true)
  }
  
}

