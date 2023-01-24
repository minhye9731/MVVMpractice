//
//  AddWeatherCityViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    // [Save] 클릭 시
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text { // 입력한 city명을 갖고
            
            addWeatherVM.addWeather(for: city) { (vm) in // view model에서 네트워크로 받은 데이터를
                self.delegate?.addWeatherDidSave(vm: vm) // delegate로 첫화면으로 전달하고
                self.dismiss(animated: true, completion: nil) // 추가화면은 닫음
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
