//
//  WeatherManager.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 12.04.22.
//

import Foundation
import CoreLocation

class WeatherManager
{
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody
    {
        guard let url = URL(string:
        "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=832a7d4ab32891a815973c2e62c556b1&units=metric")
                else
                {
                    fatalError("No URL")
                }
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
                else
                {
                    fatalError("Error fetching weather")
                }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable
{
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinatesResponse: Decodable
    {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable
    {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable
    {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable
    {
        var speed: Double
        var deg: Double
    }
}
