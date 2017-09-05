//
//  SecondViewController.swift
//  W7D4
//
//  Created by Jason Liang on 8/10/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit
import RxSwift
import Stevia

class CellViewModel : NSObject {
  let isOn = Variable<Bool>(false)
}

class Cell : UICollectionViewCell {
  
  var disposeBag = DisposeBag()
  
  func bindViewModel(_ viewModel: CellViewModel) {
    disposeBag = DisposeBag()
    viewModel.isOn.asObservable().subscribe(onNext: { (isOn) in
      self.backgroundColor = isOn ? .white : .black
    }).addDisposableTo(disposeBag)
  }
  
}

class SecondViewController: UIViewController {

  let itemCount = 1000
  var cellViewModels : [CellViewModel] = []
  
  let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.sv(collectionView)
    collectionView.fillContainer()
    collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
    populateCellViewModels()
    collectionView.dataSource = self
    collectionView.backgroundColor = .red
    collectionView.isUserInteractionEnabled = false
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: 10, height: 10)
    
  }
  
  func populateCellViewModels() {
    for _ in 0...itemCount {
      cellViewModels.append(CellViewModel())
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    guard #available(iOS 9.0, *) else { return }
    guard traitCollection.forceTouchCapability == .available else { return }
    
    let force = touch.force/touch.maximumPossibleForce * CGFloat(itemCount)
    print("\(force) % force")
    
    let index = Int(round(force))
    let cellVM = cellViewModels[index]
    cellVM.isOn.value = true
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    cellViewModels.forEach { (cellVM) in
      cellVM.isOn.value = false
    }
  }

}

extension SecondViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellViewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
    
    let cellViewModel = cellViewModels[indexPath.item]
    cell.bindViewModel(cellViewModel)
    
    return cell
  }
}

