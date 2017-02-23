//
//  NumbersViewModel.swift
//  RxSwiftExample
//
//  Created by Jason Liang on 2/23/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import RxSwift

class NumbersViewModel: NSObject {

  let disposeBag = DisposeBag()
  let firstNumber = Variable<Int>(0)
  let secondNumber = Variable<Int>(0)
  
  let result = Variable<Int>(0)
  
  override init() {
    super.init()
    bindSignals()
  }
  
  func bindSignals() {
    firstNumber.asObservable().subscribe(
      onNext: { (nextNumber) in
      print("\(nextNumber)")
    },
      onError: nil,
      onCompleted: nil,
      onDisposed: nil)
    .addDisposableTo(disposeBag)
    
    let combined = Observable.combineLatest(firstNumber.asObservable(), secondNumber.asObservable()) { (n1, n2) -> (Int,Int) in
      return (n1,n2)
    }
    
    combined.asObservable().subscribe(onNext: {
      [weak self]
      (numbers) in
      guard let `self` = self else { return }
      self.result.value = numbers.0 + numbers.1
    }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(disposeBag)
    
    
    
  }
  
}
