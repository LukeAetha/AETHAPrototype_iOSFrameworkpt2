//
//  WeatherService.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 12.04.22.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject
{
    private let locationManager = CLLocationManager()
    private let API_KEY = "832a7d4ab32891a815973c2e62c556b1"
    private var completionHandler: (() -> Void)?
    
    
    public func loadWeatherData(_completionHandler: @escaping((Weather) -> Void))
    {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func makeDataRequest(forCoordinate)
    
}


struct APIResponse
{
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable
{
    let temp: Double
}

struct APIWeather: Decodable
{
    let description: String
    
}

