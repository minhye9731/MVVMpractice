//
//  String+Extensions.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
