//
//  Unit.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/25/23.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
            case .celsius: return "Celsius"
            case .fahrenheit: return "Fahrenheit"
            }
        }
    }
}
