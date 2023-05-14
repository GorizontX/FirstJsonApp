//
//  Weather.swift
//  FirstJsonApp
//
//  Created by Andrey Machulin on 14.05.2023.
//

struct Weather: Decodable {
    let location: Location
    let current: Current
}

struct Location: Decodable {
    let name: String
    let country: String
}

struct Current: Decodable {
    let temperature: Int
    let weather_descriptions: [String]
}
