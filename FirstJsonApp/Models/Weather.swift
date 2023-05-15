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
    let region: String
    let country: String
    let localtime: String
}

struct Current: Decodable {
    let temp_c: Int
}
