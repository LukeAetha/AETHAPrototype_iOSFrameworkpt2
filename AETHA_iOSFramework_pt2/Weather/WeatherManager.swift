//
//  Location.swift
//  AETHA_iOSFramework_pt2
//
//  Created by Lukas Dworschak on 13.04.22.
//

import Foundation
import CoreLocation

class WeatherManager: NSObject, ObservableObject, CLLocationManagerDelegate
{
    let manager = CLLocationManager()
    
    @Published var city: String = ""
    @Published var weather_main: String = ""
    @Published var temp: String = ""
    
    @Published var isLoading = false
    
    @Published var lat = Double()
    @Published var long = Double()
    
    @Published var remapModifier: String = ""
    
    
    let API_KEY = "832a7d4ab32891a815973c2e62c556b1"
    
    
    
    //fetching users location
    override init()
    {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        requestLocation()
    }
    
    func requestLocation()
    {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first
        else {return}
        isLoading = false
        
        self.long = location.coordinate.longitude
        self.lat = location.coordinate.latitude
        fetchWeather()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error", error)
        isLoading = false
    }
    
    
    // fetching weather Data from OpenMap API
    
    func fetchWeather()
    {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(API_KEY)&units=metric")
        else{return}
        
        print("\(lat) | \(long) |\(url)")
        print("weather is fetching")
        
    
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil
            else {return}
            print("data got fetched")
        
        //Convert Data to Model
            do
            {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.city = model.name
                    self.temp = "\(model.main.temp)°"
                    self.weather_main = model.weather.first?.main ?? "no weatherdata"
                }
                
              
            }
            catch
            {
                print ("failed decoding")
            }
   
    
        }
        task.resume()
        
//        print("\(weather_main)")
//        setRemapModifier()
        
    }
    
    
    func setRemapModifier()
    {
        if (weather_main == "Clouds")
        {
            self.remapModifier = "0.3"
        }
        else if (weather_main == "Clear")
        {
            self.remapModifier = "2"
        }
        else if (weather_main == "Thunderstorm")
        {
            self.remapModifier = "0.3"
        }
        else if (weather_main == "Rain")
        {
            self.remapModifier = "1.3"
        }
        else if (weather_main == "Snow")
        {
            self.remapModifier = "0.8"
        }
        //else if (weatherManager.weather_main == "Mist" || == "Smoke" || == "Haze" || == "Dust" || == "Fog" || "Sand" || "Ash" || "Squall" || "Tornado")
        //{
            //self.remapModifier = "0.1"
        //}
        else
        {
            self.remapModifier = "0"
        }
    }
    
    
    //JSON Model for OpenWeatherMap
    struct WeatherModel: Decodable
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
        let main: String
    }
    
}

