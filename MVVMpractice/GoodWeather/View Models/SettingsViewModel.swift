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
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue, forKey: "unit")
        }
    }
    
    
    
}
