//
//  AddWeatherCityViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    

    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=412f4b3ad7251a4cc5b26b8a732f1a4d&units=imperial")!
            
            let weatherResource = WeatherResource<Any>(url: weatherURL) { data in
                return data
                
            }
            
            WeatherWebService().load(resource: weatherResource) { result in
                
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
