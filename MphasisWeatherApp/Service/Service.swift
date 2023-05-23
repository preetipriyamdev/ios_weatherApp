//
//  Service.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import Foundation
import CoreLocation

enum ServiceError: Error {
    case invalidURL
    case missingData
}

enum RequestType {
    case cityName(city: String)
    case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
}

class Service {
    static let shared = Service()
    
    func fetchWeatherData(onRequestType: RequestType) async throws -> WeatherModel? {
        guard let url = getUrlString(onRequestType) else {
            throw ServiceError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        //parse json data
        let currentWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
        guard let currentWeather = WeatherModel(currentWeatherData: currentWeatherData) else { return nil }
        return currentWeather
    }

    private func getUrlString(_ requestType: RequestType) -> URL? {
        var urlString = ""
        switch requestType {
        case .cityName(let city):
            let cityName = city.split(separator: " ").joined(separator: "%20")
            if !cityName.isEmpty {
                UserDefaults.standard.removeObject(forKey: "city")
                UserDefaults.standard.set(cityName, forKey: "city")
            }
            urlString = "\(OpenWeather.baseUrl)q=\(cityName)&appid=\(OpenWeather.apiKey)"
        case .coordinate(let latitude, let longitude):
            urlString = "\(OpenWeather.baseUrl)lat=\(latitude)&lon=\(longitude)&appid=\(OpenWeather.apiKey)"
        }
        return URL(string: urlString)
    }
}
