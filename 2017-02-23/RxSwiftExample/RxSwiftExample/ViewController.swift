//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Jason Liang on 2/23/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  let textField1 = UITextField()
  let textField2 = UITextField()
  let label = UILabel()
  let vm = NumbersViewModel()
  var disposeBag = DisposeBag()
  let button = UIButton(type: UIButtonType.custom)
  let button2 = UIButton(type: UIButtonType.custom)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.sv(textField1, textField2, label, button, button2)
    
    self.view.layout(
      0,
      |-textField1-| ~ 100,
      20,
      |-textField2-| ~ 100,
      20,
      |-label-| ~ 50,
      20,
      |-button.size(100) - 10 - button2.size(100)
    )
    
    textField1.placeholder = "first number"
    textField2.placeholder = "second number"
    bindSignals()
    
    button.setTitle("dispose", for: UIControlState.normal)
    button.backgroundColor = .red
    button.addTarget(self, action: #selector(ViewController.disposeSignals), for: UIControlEvents.touchUpInside)
    
    button2.setTitle("bind", for: UIControlState.normal)
    button2.backgroundColor = .green
    button2.addTarget(self, action: #selector(ViewController.bindSignals), for: UIControlEvents.touchUpInside)
  }
  
  @objc private func disposeSignals() {
    disposeBag = DisposeBag()
  }
  
  @objc func bindSignals() {
    disposeSignals()
    textField1.rx.text.asObservable()
      .throttle(1, scheduler: MainScheduler.instance)
      .subscribe(onNext: {
        [weak self]
        (text) in
        guard let `self` = self else { return }
        guard let text = text else { return }
        if let number = Int(text) {
          self.vm.firstNumber.value = number
        }
    }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(disposeBag)
    
    textField2.rx.text.asObservable()
      .throttle(1, scheduler: MainScheduler.instance)
      .subscribe(onNext: {
        [weak self]
        (text) in
        guard let `self` = self else { return }
        guard let text = text else { return }
        if let number = Int(text) {
          self.vm.secondNumber.value = number
        }
        }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(disposeBag)
    
    
    vm.result.asObservable().subscribe(onNext: {
      [weak self]
      (result) in
      guard let `self` = self else { return }
      self.label.text = "\(result)"
    }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(disposeBag)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

