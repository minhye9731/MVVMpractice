//
//  WeatherResponse.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/23/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
