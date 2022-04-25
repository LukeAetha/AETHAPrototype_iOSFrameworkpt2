//
//  DataModifier.swift
//  AETHA_iOSFramework_pt2
//
//  Created by Lukas Dworschak on 18.04.22.
//

import Foundation
import SwiftUI

class DataModifier: NSObject, ObservableObject
{
    //Visual Modifiers
    @Published var colorModifier: String = ""
    @Published var turbulanceModifier: String = ""
    @Published var remapModifier: String = ""
    
    //Sound Modifiers
    @Published var soundModifier: String = ""
    
    var stepCount = 1500 //change this when HealthData is working
    
    @StateObject var weatherManager = WeatherManager() //not sure if that works or if it has to be an EnvironmentObject
    
  
    
    func setRemapModifier()
    {
        if (weatherManager.weather_main == "Clouds")
        {
            self.remapModifier = "0.3"
        }
        else if (weatherManager.weather_main == "Clear")
        {
            self.remapModifier = "2"
        }
        else if (weatherManager.weather_main == "Thunderstorm")
        {
            self.remapModifier = "0.3"
        }
        else if (weatherManager.weather_main == "Rain")
        {
            self.remapModifier = "1.3"
        }
        else if (weatherManager.weather_main == "Snow")
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
    
    func setTurbulanceModifier()
    {
        if (stepCount <= 200)
        {
            self.turbulanceModifier = "0.12"
        }
        else if (stepCount > 200 && stepCount <= 1000)
        {
            self.turbulanceModifier = "0.09"
        }
        else if (stepCount > 1000 && stepCount <= 2000)
        {
            self.turbulanceModifier = "0.07"
        }
        else if (stepCount > 2000 && stepCount <= 6000)
        {
            self.turbulanceModifier = "0.05"
        }
        else if (stepCount > 6000)
        {
            self.turbulanceModifier = "0.02"
        }
        else
        {
            self.turbulanceModifier = "0"
        }
    }
    
    func setSoundModifier()
    {
//        if weatherManager.temp < 0 //turn temprature into a INT!
//        {
//            self.soundModifier = ""
//        }
    }
    
    

}
