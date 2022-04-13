//
//  WeatherViewModel.swift
//  AETHA_iOSFramework_pt2
//
//  Created by Lukas Dworschak on 13.04.22.
//

import Foundation


class WeatherViewModel: ObservableObject
{
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var temp: String = ""
    @Published var timezone: String = ""
}
