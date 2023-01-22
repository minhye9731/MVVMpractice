//
//  WebService.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/20/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        AF.request(url, method: .get).responseData { response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)

                let itemData = json["articles"].arrayValue
                print("itemData \(itemData)")
                print("itemData.count \(itemData.count)")
                
                let array: [Article] = itemData.map { fullArticle -> Article in
                    let title = fullArticle["title"].stringValue
                    let description = fullArticle["description"].stringValue
                    
                    return Article(title: title, description: description)
                }
                completion(array)

            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
