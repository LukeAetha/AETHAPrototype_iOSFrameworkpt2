//
//  Weather.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 12.04.22.
//

import Foundation

public struct Weather
{
    let city: String
    let temperature: String
    let description: String
    
    
    init(response: APIResponse)
    {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
    }
}

