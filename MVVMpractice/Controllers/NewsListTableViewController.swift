//
//  NewsListTableViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/20/23.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setNavi()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=37aa51bb50c6467d81fc0956610ef893")!
        Webservice().getArticles(url: url) { _ in
            
        }
    }
    
    private func setNavi() {
        let navibarAppearance = UINavigationBarAppearance()
        
        navibarAppearance.backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        navibarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navibarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationItem.scrollEdgeAppearance = navibarAppearance
        self.navigationItem.standardAppearance = navibarAppearance // 여기서의 글자색상은 large말고 그냥 textattribute로 해야 함.
        
    }
    
    
    
    
}
