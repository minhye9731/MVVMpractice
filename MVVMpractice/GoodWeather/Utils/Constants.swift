//
//  Constants.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
//            get the default settings for temperature
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
                                        
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=412f4b3ad7251a4cc5b26b8a732f1a4d&units=\(unit)")!
        }
    }
}
