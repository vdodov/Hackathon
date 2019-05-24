//
//  ListViewController.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  lazy var dao = MemoDAO()
  
  let topView = UIView()
  let userMessage = UILabel()
  
  
  var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
    
  }()
  
  var tempColor: UIColor = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSubview()
    autoLayout()
    configure()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // 코어 데이터에 저장된 데이터를 가져온다
    self.appDelegate.memolist = self.dao.fetch()
    
    self.collectionView.reloadData()
  }
  
  private func addSubview() {
    view.addSubview(collectionView)
    //    view.addSubview(subject)
    //    view.addSubview(registerDate)
    view.addSubview(topView)
    topView.addSubview(userMessage)
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    topView.translatesAutoresizingMaskIntoConstraints = false
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.bottomAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
    
    userMessage.translatesAutoresizingMaskIntoConstraints = false
    userMessage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20).isActive = true
    userMessage.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20).isActive = true
    userMessage.widthAnchor.constraint(equalToConstant: 150).isActive = true
    userMessage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    collectionView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.8).isActive = true
    
  }
  
  private func configure() {
    let settingVC = SettingViewController()
    topView.backgroundColor = .red
    userMessage.backgroundColor = .white
    userMessage.textColor = .black
    userMessage.text = settingVC.userMessageLabel.text
    userMessage.textAlignment = .center
    
    collectionView.backgroundColor = .white
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
    
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    
    userMessage.textColor = .black
    
    
  }
}

extension ListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    let count = self.appDelegate.memolist.count
    return count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
    
    // memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼냄
    let item = self.appDelegate.memolist[indexPath.item]
    // 이미지 속성이 비어 있을 경우 "memoCell", 아니면 "memoCellwithImage"
    //    let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
    // 재사용 큐로부터 프로토타입 셀의 인스턴스를 전달받는다
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
    // memoCell의 내용을 구성
    cell.subject.text = item.title
    cell.view.tag = indexPath.item
    cell.delegate = self
    cell.view.backgroundColor = tempColor
    
    // Date 타입의 날짜 포맷지정
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    cell.registerDate.text = formatter.string(from: item.registerDate!)
    return cell
  }
}

extension ListViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    let item = self.appDelegate.memolist[indexPath.item]
    detailVC.savedData = item
    show(detailVC, sender: nil)
  }
  
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: view.frame.width, height: view.frame.width)
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
    
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
    
    return 0
  }
  
  //셀 사이의 간격
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
    
    return 0
  }
}

extension ListViewController: CustomCollectionViewCellDelegate {
  
  func removeCell(_ sender: Int) {
    let data = self.appDelegate.memolist[sender]
    if dao.delete(data.objectID!) {
      self.appDelegate.memolist.remove(at: sender)
    }
    collectionView.reloadData()
  }
}
