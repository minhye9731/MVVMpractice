//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by 강민혜 on 1/30/23.
//

import XCTest
@testable import MVVMpractice

final class CalculatorAppTests: XCTestCase {
    
    
    func test_SubtractTwoNumbers() {
        let calculator = Calculator()
        let result = calculator.subtract(5, 2)
        XCTAssertEqual(result, 3)
    }

    func test_AddTwoNumbers() {
        let calculator = Calculator()
        let result = calculator.add(2, 3)
        
        XCTAssertEqual(result, 5)
    }

}
