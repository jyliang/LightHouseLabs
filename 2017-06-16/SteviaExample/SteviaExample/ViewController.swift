//
//  ViewController.swift
//  SteviaExample
//
//  Created by Jason Liang on 6/16/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  let searchField = UISearchBar()
  let buttonContainer = UIView()
  let prevButton = UIButton(type: UIButtonType.custom)
  let playButton = UIButton(type: UIButtonType.custom)
  let nextButton = UIButton(type: UIButtonType.custom)
  let label = UILabel()
  
//  let text = Variable<String>("")
  let text = Variable<String?>(nil)
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.sv(searchField, buttonContainer, label)
    
    view.layout(
      20,
      searchField.fillHorizontally().height(50),
      20,
      |-40-buttonContainer-40-| ~ 60,
      20,
      label.fillHorizontally().height(40)
//      buttonContainer.fillHorizontally(m: 40) ~ 60
//      buttonContainer.height(60).fillHorizontally(m:40)
    )
    
    buttonContainer.backgroundColor = UIColor.lightGray
    
    buttonContainer.sv(prevButton, playButton, nextButton)
  
    playButton.size(50).centerInContainer()
    prevButton.size(50).centerVertically().centerHorizontally(-100)
    nextButton.size(50).centerVertically().centerHorizontally(100)
    
    playButton.setImage(#imageLiteral(resourceName: "ic_play_circle_outline"), for: .normal)
    prevButton.setImage(#imageLiteral(resourceName: "ic_skip_previous"), for: .normal)
    nextButton.setImage(#imageLiteral(resourceName: "ic_skip_next"), for: .normal)
    playButton.tap(playTapped)
    
    
    bindSignals()
    
  }
  
  var disposeBag = DisposeBag()
  
  func bindSignals() {
    self.searchField.rx.text.asObservable()
//      .debounce(1, scheduler: MainScheduler.instance)
      .throttle(0.3, scheduler: MainScheduler.instance)
      .subscribe(onNext: {
      [weak self]
      (searchFieldText) in
      guard let `self` = self else { return }
        self.text.value = searchFieldText
//      self.label.text = searchFieldText
    }).addDisposableTo(disposeBag)
    
    
    // method 1
//    self.text.asObservable().bind(to: self.label.rx.text).addDisposableTo(disposeBag)
    
    // method 2 - recommended to start with this
    self.text.asObservable().subscribe(onNext: {
      [weak self]
      (text) in
      guard let `self` = self else { return }
      print("text")
      self.label.text = text
    }).addDisposableTo(disposeBag)
    
    
//    DispatchQueue.main.async {
//      self.bindSignals()
//    }
//    
//    UIView.animate(withDuration: 0.1) { 
//      self.bindSignals()
//    }
  }
  
  func playTapped() {
    print("play tapped")
  }

}

