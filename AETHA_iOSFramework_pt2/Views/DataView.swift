//
//  DataView.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 07.04.22.
//

import SwiftUI


struct DataView: View {
    

@StateObject var weatherViewModel = WeatherManager()
    
    
  
    
    var body: some View {
                    VStack (alignment: .leading, spacing: 20)
                    {
        
                        HStack(spacing: 10)
                        {
                            VStack
                            {
                            Text("Location")
                                .font(.title2)
                            Text("lat:\(weatherViewModel.lat)")
                            Text("long:\(weatherViewModel.long)")
                            }
                            
                            VStack
                            {
                            Text("Weather")
                                .font(.title2)
                            Text(weatherViewModel.city)
                            Text(weatherViewModel.temp)
                            Text(weatherViewModel.weather_main)
                            }
                        }
                        .padding(.bottom, 20)
        
                        VStack(alignment: .leading, spacing: 10)
                        {
        
                            Text("Activitylevel")
                                .font(.title2)
                            Text("steps:     -")
        
                        }
                        .padding(.bottom, 50)
        
        
                    VStack
                    {
                     
        
        
                        Button(action: {
                            //Unity.shared.show()
                            //Unity.shared.sendMessage("Visuals", methodName: "SetValues", message: "dataisfetched")
                        })
                        {
                                Text("launch Experience")
                                .frame(width: 200, height: 60)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(10)
        
        
                        }
        
                    }.padding(70)
                        
                        
                      
                        
                    }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}

