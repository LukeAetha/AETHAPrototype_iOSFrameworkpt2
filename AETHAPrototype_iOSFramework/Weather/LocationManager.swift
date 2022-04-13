//
//  LocationManager.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 12.04.22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate
{
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init()
    {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
//    func setupLocation()
//    {
//        manager.requestWhenInUseAuthorization()
//    }
    
    func requestLocation()
    {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location = locations.first?.coordinate
            else
            {
                return
            }
            isLoading = false
            manager.stopUpdatingLocation()
         
        print ("\(String(describing: location.longitude)) | \(String(describing: location.latitude))")
    }
        
        
        
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("Error getting location", error)
        isLoading = false
    }
}
