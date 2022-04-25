//
//  DataView.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 07.04.22.
//

import SwiftUI


struct DataView: View {
    

@StateObject var weatherData = WeatherManager()
@StateObject var activityData = HealthManager()
@StateObject var dataModifier = DataModifier()
@StateObject var dayTime = TimeManager()
    
    
  
    
    var body: some View {
        VStack (alignment: .center, spacing: 10)
                    {
                        VStack (alignment: .leading)
                        {
                            HStack(alignment: .top, spacing: 100)
                            {
                                VStack(alignment: .leading)
                                {
                                    Text("Location")
                                        .font(.title3)
                                    Text(weatherData.city)
                                        .font(.title3)
                                    Text("lat:\(weatherData.lat)")
                                    Text("long:\(weatherData.long)")
                                }
                            
                            
                                VStack(alignment: .trailing)
                                {
                                    Text("Weather")
                                        .font(.title3)
                                    Text(weatherData.weather_main)
                                        .font(.title3)
                                    Text("\(weatherData.temp)C")
                                }
                                .multilineTextAlignment(.trailing)
                            }
                            .padding(.bottom, 30)
        
                            VStack(alignment: .leading)
                            {
                                Text("Activitylevel")
                                    .font(.title2)
                                Text("steps today:\(activityData.stepCount)")
                            }
                            .padding(.bottom, 30)
                            
                            VStack(alignment: .leading)
                            {
                                Text("Daytime")
                                    .font(.title2)
                                Text("\(dayTime.time)")
                                Text("\(dayTime.daysector)")
                            }
                            .padding(.bottom, 150)
                            
                        }
        
        
                    
                        Button(action:
                        {
                            //Unity.shared.show()
                            //Unity.shared.UnitySendMessage("Visuals", methodName : "setTurbulance", message: "\(weatherData.weather_main)")
                            //Unity.shared.UnitySendMessage("Visuals", methodName : "setRemamp", message: "\(activityData.stepCount)")
                            //Unity.shared.UnitySendMessage("Visuals", methodName : "setColor", message: "\(dayTime.daysector)")
                            //Unity.shared.UnitySendMessage("Sound", methodName : "setSound", message: "\(dataModifier.soundModifier)")
                            
                            print ("\(activityData.stepCount)|\(weatherData.weather_main)|\(dayTime.daysector)")
                        })
                        {
                            Text("launch Experience")
                                .frame(width: 200, height: 60)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                    }.padding(20)
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}

