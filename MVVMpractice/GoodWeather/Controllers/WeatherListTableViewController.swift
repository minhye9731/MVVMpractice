//
//  WeatherListTableViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
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

extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.cityNameLabel.text = "Houston"
        cell.temperatureLabel.text = "70°"
        return cell
    }
}
