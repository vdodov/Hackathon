//
//  SettingViewController.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let tableView = UITableView()
//    let defaultButton = UIButton(type: .custom)
//    let darkModeButton = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        autoLayout()
        configure()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//}
    
    
    func addSubview() {
        view.addSubview(tableView)
//        view.addSubview(defaultButton)
//        view.addSubview(darkModeButton)
        
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
//        defaultButton.translatesAutoresizingMaskIntoConstraints = false
//        defaultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        defaultButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        darkModeButton.translatesAutoresizingMaskIntoConstraints = false
//        darkModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        darkModeButton.topAnchor.constraint(equalTo: defaultButton.bottomAnchor, constant: 10).isActive = true
    }
    
    func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
//        defaultButton.setTitle("Default", for: .normal)
//        defaultButton.addTarget(self, action: #selector(defaultButton(_:)), for: .touchUpInside)
//        defaultButton.backgroundColor = .lightGray
//
//        darkModeButton.setTitle("Dark Mode", for: .normal)
//        darkModeButton.addTarget(self, action: #selector(darkButton(_:)), for: .touchUpInside)
//        darkModeButton.backgroundColor = .lightGray
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
        
        
        
        //print(tabBarController?.viewControllers![1])
        //print(tabBarController?.viewControllers![2])
        //self.loadView()
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Theme.num
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
        case 1:
            Theme.darkBlueTheme()
            
            tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
            tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        case 2:
            Theme.pinkTheme()
            
            tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
            tabBarController?.tabBar.barTintColor = Theme.tabBarTint
        default:
            break
        }
    }
}
