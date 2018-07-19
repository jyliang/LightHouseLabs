//
//  ViewController.swift
//  W7D4
//
//  Created by Jason Liang on 7/19/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var box1: CircleView!
  
  let box2 = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
  
  var animator : UIDynamicAnimator!
  var attachmentBehavior : UIAttachmentBehavior?
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    box2.backgroundColor = UIColor.green
    box1.backgroundColor = UIColor.clear
    self.view .addSubview(box2)
    
    animator = UIDynamicAnimator(referenceView: self.view)
    
    let gravityBehavior = UIGravityBehavior(items: [box1, box2])
    animator.addBehavior(gravityBehavior)
    
    addCollisionBehavior()
    addAttachmentBehavior()
    addItemBehavior()
  }
  
  func addCollisionBehavior() {
    let collisionBehavior = UICollisionBehavior(items: [box1, box2])
    collisionBehavior.translatesReferenceBoundsIntoBoundary = true
    animator.addBehavior(collisionBehavior)
    collisionBehavior.collisionDelegate = self
    
        let from = CGPoint(x: 0, y: self.view.bounds.height - 100)
        let to = CGPoint(x: self.view.bounds.width, y: self.view.bounds.height - 100)
        collisionBehavior.addBoundary(withIdentifier: "bottom" as NSCopying, from: from, to: to)
  }
  
  func addAttachmentBehavior() {
    let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    box1.addGestureRecognizer(pan)
  }
  
  @objc func handlePan(_ panGesture:UIPanGestureRecognizer) {
    // get gesture location
    guard let panView = panGesture.view else { return }
    
    let location = panGesture.location(in: self.view)
    
    switch panGesture.state {
    case .began:
      let attachmentBehavior = UIAttachmentBehavior(item: panView, attachedToAnchor: location)
      animator.addBehavior(attachmentBehavior)
      self.attachmentBehavior = attachmentBehavior
    case .changed:
      if let attachmentBehavior = attachmentBehavior {
        attachmentBehavior.anchorPoint = location
      }
    case .ended: fallthrough
    default:
      if let attachmentBehavior = attachmentBehavior {
        animator.removeBehavior(attachmentBehavior)
      }
      attachmentBehavior = nil
      
    }
  }
  
  func addItemBehavior() {
    let itemBehavior = UIDynamicItemBehavior(items: [box1, box2])
    itemBehavior.elasticity = 1
    animator.addBehavior(itemBehavior)
  }

}

extension ViewController : UICollisionBehaviorDelegate {
  func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
    if let view = item1 as? CircleView {
      view.shapeLayer.fillColor = UIColor.random().cgColor
//      view.backgroundColor = UIColor.random()
    }
    if let view = item2 as? CircleView {
      view.shapeLayer.fillColor = UIColor.random().cgColor
//      view.backgroundColor = UIColor.random()
    }
  }
}

extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}

extension UIColor {
  static func random() -> UIColor {
    return UIColor(red:   .random(),
                   green: .random(),
                   blue:  .random(),
                   alpha: 1.0)
  }
}

