//
//  GSThemeViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/09.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSThemeViewController: UIViewController {
  
  private let mainImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
  }
  
  private lazy var layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
    $0.minimumInteritemSpacing = 0
    $0.minimumLineSpacing = 0
    $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  private lazy var itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.register(GSCategoryCollectionCell.self, forCellWithReuseIdentifier: GSCategoryCollectionCell.id)
    $0.isPagingEnabled = true
    $0.backgroundColor = .white
    $0.showsHorizontalScrollIndicator = false
  }
  
  private let itemData: [GSCollectionItem]
  
  init(imageName: String, data: [GSCollectionItem]) {
    mainImageView.image = UIImage(named: imageName)
    itemData = data
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    view.backgroundColor = .white
    [mainImageView, itemCollectionView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    mainImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.36)
    }
    itemCollectionView.snp.makeConstraints {
      $0.top.equalTo(mainImageView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

extension GSThemeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GSCategoryCollectionCell.id, for: indexPath)
    return cell
  }
}

extension GSThemeViewController: UICollectionViewDelegate {
  
}
