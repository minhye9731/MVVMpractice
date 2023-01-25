//
//  SettingsTableViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/25/23.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi()
    }
    
    private func setNavi() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .white
        
        let navibarAppearance = UINavigationBarAppearance()
        navibarAppearance.backgroundColor = UIColor(displayP3Red: 52/225, green: 152/255, blue: 219/255, alpha: 1/0)
        navibarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navibarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationItem.scrollEdgeAppearance = navibarAppearance
        self.navigationItem.standardAppearance = navibarAppearance
    }
    
}

extension SettingsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(settingsViewModel.units.count)
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        print(settingsItem.displayName)
        return cell
    }
}
