////
////  Location.swift
////  UnityBrdige
////
////  Created by Lukas Dworschak on 19.03.22.
////
//
//import Foundation
//import CoreLocation
//
//class fetchLocation: NSObject, ObservableObject, CLLocationManagerDelegate
//{
//    let manager = CLLocationManager()
//
//    @Published var location: CLLocation?
//    @Published var isLoading = false
//
//    @Published var lat = Double()
//    @Published var long = Double()
//
//    override init()
//    {
//        super.init()
//        manager.delegate = self
//    }
//
//    func setupLocation()
//    {
//        manager.delegate = self
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
//    {
//        if !locations.isEmpty, location == nil
//        {
//            location = locations.first
//            manager.stopUpdatingLocation()
//            requestLocation()
//        }
//    }
//
////    func requestLocation()
////    {
////        guard let location = fetchedlocation
////        else
////        {
////            return
////        }
////        self.long.append = fetchedlocation.coordinate.longitude
////        self.lat.append = fetchedlocation.coordinate.latitude
////
////        print ("\(long) | \(lat)")
//
//
//
//
//    }
//
//
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
//    {
//        print("fetching location failed")
//        isLoading = false
//    }
//
//
//
//
//
//
//
//}

