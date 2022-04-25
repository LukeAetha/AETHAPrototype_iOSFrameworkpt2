//
//  fetchTime.swift
//  AETHA_iOSFramework_pt2
//
//  Created by Lukas Dworschak on 25.04.22.
//

//fetching current Daytime
import Foundation

class TimeManager: NSObject, ObservableObject
{
    @Published var time: String = ""
    @Published var daysector: String = ""
    
    var hour = Int()
    var minute = Int()
    
    override init()
    {
        super.init()
        getDate()
    }
    
    
    func getDate()
    {
        let date = Date()
        let calendar = Calendar.current
        self.hour = calendar.component(.hour, from: date)
        self.minute = calendar.component(.minute, from: date)
        self.time = "\(hour):\(minute)"
    
        setDaySector()
    }
    
    func setDaySector()
    {
        if 6...10 ~= hour
        {
            self.daysector = "morning"
        }
        else if 11...14 ~= hour
        {
            self.daysector = "lunch"
        }
        else if 15...18 ~= hour
        {
            self.daysector = "afternoon"
        }
        else if 19...24 ~= hour
        {
            self.daysector = "evening"
        }
        else
        {
            self.daysector = "night"
        }
        
    }
    
   
    

}
