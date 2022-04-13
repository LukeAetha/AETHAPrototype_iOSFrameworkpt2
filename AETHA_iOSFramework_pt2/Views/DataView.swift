//
//  DataView.swift
//  AETHAPrototype_iOSFramework
//
//  Created by Lukas Dworschak on 07.04.22.
//

import SwiftUI


struct DataView: View {
    
//  @StateObject var locationManager = fetchLocation()
//  @StateObject var healthStore = fetchActivity()
//    @StateObject var locationManager = LocationManager()
    
  
    
    var body: some View {
                    VStack (alignment: .leading, spacing: 20)
                    {
        
                        VStack(alignment: .leading, spacing: 10)
                        {
                            Text("Location")
                                .font(.title2)
                            if let location = locationManager.location
                            {
                                Text("lat:\(location.longitude)")
                                Text("long:\(location.latitude)")
                            }
                            else
                            {
                                if locationManager.isLoading
                                {
                                    ProgressView()
                                }
                                else
                                {
                                   Text("---")
                                   Text("---")
                                }
                            }
                            
                        }
                        .padding(.bottom, 50)
        
                        VStack(alignment: .leading, spacing: 10)
                        {
        
                            Text("Activity")
                                .font(.title2)
                            Text("steps:     -")
        
                        }
                        .padding(.bottom, 50)
        
                        VStack(alignment: .leading, spacing: 10)
                        {
        
                            Text("Star Sign")
                                .font(.title2)
                            Text("-")
        
                        }
                        .padding(.bottom, 70)
        
        
                    VStack
                    {
                     
        
        
                        Button(action: {
                            Unity.shared.show()
                            Unity.shared.sendMessage("Visuals", methodName: "SetValues", message: "dataisfetched")
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

