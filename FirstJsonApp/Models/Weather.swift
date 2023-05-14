//
//  Weather.swift
//  FirstJsonApp
//
//  Created by Andrey Machulin on 14.05.2023.
//

struct Weather: Codable {
    let location: Location
    let current: Current
}

struct Location: Codable {
    let name: String
    let country: String
}

struct Current: Codable {
    let temperature: Double
    let weather_descriptions: [String]
}
