//
//  WeatherWebService.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation

struct WeatherResource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WeatherWebService {
    
    func load<T>(resource: WeatherResource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            print(data)
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
