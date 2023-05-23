//
//  SearchResult.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Codable, Hashable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
}


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: Sys
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Weather: Codable {
    let id: Int
}

struct Sys: Codable {
    let country: String
}
