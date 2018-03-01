//
//  FirstViewController.swift
//  W7D4
//
//  Created by Jason Liang on 3/1/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var boxView1: UIView!
    @IBOutlet weak var boxView2: UIView!
    
    var animator : UIDynamicAnimator!
    
    var gravityBehavior : UIGravityBehavior!
    
    var attachmentBehavior : UIAttachmentBehavior? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
        gravityBehavior = UIGravityBehavior(items: [boxView1])
        animator.addBehavior(gravityBehavior)
        
        addCollisionBehavior()
        addAttachmentBehavior()
        modifyItemBehavior()
    }
    
    func modifyItemBehavior() {
        let itemBehavior = UIDynamicItemBehavior(items: [boxView1])
        itemBehavior.elasticity = 1
        itemBehavior.density = 1000000
        animator.addBehavior(itemBehavior)
        
        let itemBehavior2 = UIDynamicItemBehavior(items: [boxView2])
        itemBehavior2.density = 100000000
        animator.addBehavior(itemBehavior2)
    }
    
    func addCollisionBehavior() {
        let collisionBehavior = UICollisionBehavior(items: [boxView1, boxView2])
        
        let from = CGPoint(x: 0, y: self.view.bounds.height - 100)
        let to = CGPoint(x: self.view.bounds.width, y: self.view.bounds.height - 200)
        collisionBehavior.addBoundary(withIdentifier: "bottom" as NSCopying, from: from, to: to)
        
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionDelegate = self
        animator.addBehavior(collisionBehavior)
        
        
        
        
    }
    
    func addAttachmentBehavior() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        boxView1.addGestureRecognizer(pan)
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


}

extension FirstViewController : UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
//        if let item1 = item1 as? UIView {
//            item1.backgroundColor = UIColor.random()
//        }
//        if let item2 = item2 as? UIView {
//            item2.backgroundColor = UIColor.random()
//        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if let item = item as? UIView {
            item.backgroundColor = UIColor.random()
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
