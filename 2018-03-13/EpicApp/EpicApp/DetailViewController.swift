//
//  DetailViewController.swift
//  EpicApp
//
//  Created by Jason Liang on 3/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
import AVKit
import Stevia
import Lottie
import MaterialComponents.MaterialButtons

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    let email = UITextField()
    let password = UITextField()
    let forgot = MDCRaisedButton()//UIButton(type: .custom)
    let login = UIButton(type: .custom)
    var toggled = false

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        let animationView = LOTAnimationView(name: "switch")
        
        
        view.sv(email,password,forgot,login, animationView)
        
        view.layout(
            100,
            |-email.style(basicStyle)-| ~ 80,
            8,
            |-password.style(basicStyle)-forgot.style(basicStyle).width(100)-| ~ 80,
            8,
            |-animationView.width(200).height(200),
            >=20,
            |login.style(basicStyle)| ~ 80,
            0
        )
//        email.style(basicStyle)
        forgot.setTitle("forgot", for: .normal)
        login.setTitle("login", for: .normal)
        
        login.tap {
            self.toggled = !self.toggled
            if self.toggled {
            animationView.play(fromProgress: 0, toProgress: 0.5, withCompletion: nil)
            } else {
            animationView.play(fromProgress: 0.5, toProgress: 1, withCompletion: nil)
            }
            
            
        }
        
//        animationView.play{ (finished) in
//            // Do Something
//        }
        
    }
    
    func basicStyle(view:UIView) {
        view.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBAction func videoButtonTapped() {
//        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()

        
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)

        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.view.addSubview(playerViewController.view)
        playerViewController.willMove(toParentViewController: self)
        self.addChildViewController(playerViewController)
        playerViewController.didMove(toParentViewController: self)
        
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
}

