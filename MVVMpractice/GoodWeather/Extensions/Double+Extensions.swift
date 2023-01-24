//
//  Double+Extensions.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/24/23.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
    
}
