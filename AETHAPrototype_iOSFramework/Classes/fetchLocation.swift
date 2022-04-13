//
//  Location.swift
//  UnityBrdige
//
//  Created by Lukas Dworschak on 19.03.22.
//

import Foundation
import CoreLocation

class fetchLocation: NSObject, ObservableObject, CLLocationManagerDelegate
{
    let manager = CLLocationManager()
    
    @Published var location: CLLocation?
    @Published var isLoading = false
    
    override init()
    {
        super.init()
        manager.delegate = self
    }
    
    func setupLocation()
    {
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if !locations.isEmpty, location == nil
        {
            location = locations.first
            manager.stopUpdatingLocation()
            requestLocation()
        }
    }
        
    func requestLocation()
    {
        guard let fetchedlocation = location else
        {
            return
        }
        let long = fetchedlocation.coordinate.longitude
        let lat = fetchedlocation.coordinate.latitude
            
        print ("\(long) | \(lat)")
        
    
            
    }
    

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("fetching location failed")
        isLoading = false
    }
    
    
    
    
   
    
    
}

