//
//  SettingsViewModel.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/25/23.
//

import Foundation

class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            let result = Unit(rawValue: unitValue) ?? .fahrenheit
            return result
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
