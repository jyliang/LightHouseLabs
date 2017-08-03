//
//  FirstViewController.swift
//  W6D4
//
//  Created by Jason Liang on 8/3/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollisionBehaviorDelegate {

  @IBOutlet weak var objectView: UIView!
  @IBOutlet weak var bottomView: UIView!
  var animator : UIDynamicAnimator!
  
  var gravityBehavior : UIGravityBehavior!
  var attachmentBehavior : UIAttachmentBehavior!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    animator = UIDynamicAnimator(referenceView: self.view)
    
    gravityBehavior = UIGravityBehavior(items: [objectView])
    let collisonBehavior = UICollisionBehavior(items: [objectView, bottomView])
    collisonBehavior.translatesReferenceBoundsIntoBoundary = true
    collisonBehavior.collisionDelegate = self
    
    animator.addBehavior(gravityBehavior)
    animator.addBehavior(collisonBehavior)
    
    let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    
    objectView.addGestureRecognizer(pan)
  }
  
  func handlePan(_ pan:UIPanGestureRecognizer) {
    let location = pan.location(in: view)
    switch pan.state {
    case .began:
      attachmentBehavior = UIAttachmentBehavior(item: objectView, attachedToAnchor: location)
      animator.addBehavior(attachmentBehavior)
      
      break
    case .changed:
      attachmentBehavior.anchorPoint = location
      
      break
    case .ended:
      animator.removeBehavior(attachmentBehavior)
    
      break
    default:
      break
    }
  }
  
  /*
  func pan(_ pan: UIPanGestureRecognizer) {
    var location = pan.location(in: view)
    
    switch pan.state {
 */
  
  func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    print("contact at \(p)")
    if let item = item as? UIView {
      item.backgroundColor = .red
    }
  }
  
  func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
    if let item = item as? UIView {
      item.backgroundColor = .yellow
    }
  }



}

