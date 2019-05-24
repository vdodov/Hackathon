//
//  SettingViewController.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
  
  let topView = UIView()
//  let userImageView = UIImageView()
  let userMessageLabel = UILabel()
  let userUpdateButton = UIButton(type: .system)
  
  
  let tableView = UITableView()
  //    let defaultButton = UIButton(type: .custom)
  //    let darkModeButton = UIButton(type: .custom)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addSubview()
    autoLayout()
    configure()
  }
  
      override func viewWillAppear(_ animated: Bool) {
        let state = UserDefaults.standard.object(forKey: "state")
        userMessageLabel.text = state as? String
        
//        let image = UserDefaults.standard.object(forKey: "image")
//        userImageView.image = image as? UIImage
  }
  
  
  func addSubview() {
    view.addSubview(topView)
    view.addSubview(tableView)
    
//    topView.addSubview(userImageView)
    topView.addSubview(userMessageLabel)
    topView.addSubview(userUpdateButton)
    
  }
  
  func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    topView.translatesAutoresizingMaskIntoConstraints = false
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    
    
//    userImageView.translatesAutoresizingMaskIntoConstraints = false
//    userImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20).isActive = true
//    userImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
//    userImageView.trailingAnchor.constraint(equalTo: userMessageLabel.leadingAnchor).isActive = true
//    userImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20).isActive = true
    
    
    userMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    userMessageLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant:   20).isActive = true
    userMessageLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
    userMessageLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -60).isActive = true
    userMessageLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
    
    userUpdateButton.translatesAutoresizingMaskIntoConstraints = false
    userUpdateButton.topAnchor.constraint(equalTo: userMessageLabel.bottomAnchor).isActive = true
    userUpdateButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 20).isActive = true
    userUpdateButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    userUpdateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    tableView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.8).isActive = true
  }
  
  func configure() {
    topView.backgroundColor = .white
    
//    userImageView.backgroundColor = .green
//    let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTap(_:)))
//    userImageView.isUserInteractionEnabled = true
//    userImageView.addGestureRecognizer(imageTapGesture)
    
    
    userMessageLabel.backgroundColor = .white
    userMessageLabel.textAlignment = .center
    userMessageLabel.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    userMessageLabel.layer.borderWidth = 1
    
    userUpdateButton.setTitle("수정", for: .normal)
    userUpdateButton.addTarget(self, action: #selector(diduserUpdateButtonDidTap(_:)), for: .touchUpInside)
    
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  @objc func diduserUpdateButtonDidTap(_ sender: UIButton) {
    alertAction()
  }
    
//    @objc func imageViewDidTap(_ sender: UIImageView) {
//        let picker = UIImagePickerController()
//
//        picker.delegate = self
//        picker.allowsEditing = true
//        present(picker, animated: false)
//    }
  
  func alertAction() {
    
    let alert = UIAlertController(title: "수정", message: "", preferredStyle: .alert)
    alert.addTextField { (tf) in
      tf.placeholder = "내용을 입력하세요."
        
    }
    let okAction = UIAlertAction(title: "수정하기", style: .default) { (_) in

      if let typingSomething = alert.textFields?[0].text {
        self.userMessageLabel.text = typingSomething
        UserDefaults.standard.set(typingSomething, forKey: "state")
        
      }
      print("수정하기")
    }
    let cancelAction = UIAlertAction(title: "취소", style: .cancel)
    
    alert.addAction(okAction)
    alert.addAction(cancelAction)
    self.present(alert, animated: true)
  }
  
  
  @objc func defaultButton(_ sender: UIButton) {
    Theme.defaultTheme()
    
  }
  
  @objc func darkButton(_ sender: UIButton) {
    Theme.defaultTheme()
    guard let vc = tabBarController?.viewControllers![0] as? ViewController,
      let listVC = tabBarController?.viewControllers![1] as? ListViewController
      else { return }
    let button = vc.writeButton
    let dateLabel = vc.dateLabel
    let textLabel = vc.mainLabel
    button.backgroundColor = Theme.writeButton
    dateLabel.textColor = Theme.dateLabel
    textLabel.textColor = Theme.mainLabel
    listVC.tempColor = Theme.cardView
    
    
    
   
  }
}

extension SettingViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "테마"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return themeName.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = themeName[indexPath.row]
    return cell
  }
  
  
}

extension SettingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      Theme.defaultTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 1:
      Theme.darkBlueTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 2:
      Theme.pinkTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 3:
        Theme.violetTheme()
        
        tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
        tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 4:
        Theme.greenTheme()
        
        tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
        tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 5:
        Theme.grayTheme()
        
        tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
        tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 6:
        Theme.yellowTheme()
        
        tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
        tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    default:
      break
    }
  }
}

//extension SettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true)
//
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        let origianlImage = info[.originalImage] as! UIImage
//        let editedImage = info[.editedImage] as? UIImage
//        let selectedImage = editedImage ?? origianlImage
//        self.userImageView.image = selectedImage
//
//
//        UserDefaults.standard.set(selectedImage, forKey: "image")
//
//        picker.dismiss(animated: false)
//    }
//
//}

