//
//  SwiftUIView.swift
//  UnityBrdige
//
//  Created by Lukas Dworschak on 19.03.22.
//

import SwiftUI
import CoreLocationUI

struct SwiftUIView: View {
    
    @StateObject var locationManager = fetchLocation()
    @StateObject var healthStore = fetchActivity()
    
    @State var dataIsFetched = false
    
    var body: some View {
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [Color("aethagrey"), Color("aethaorange"), Color("aethapink")]),startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
        
            VStack (alignment: .leading, spacing: 20)
            {
               
                VStack(alignment: .leading, spacing: 10)
                {
                    Text("Location")
                        .font(.title2)
                    Text("lat:      -")
                    Text("long:  -")
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
                Button(action:
                {
                    locationManager.setupLocation()
                    healthStore.authorizeHealthKit()
                    dataIsFetched = true
                    //dataIsFetched toggles to true regardless wether actual Data is fetched or not
                })
                {
                        Text("fetch Data")
                        .frame(width: 200, height: 60)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                
                }.padding(5)
              
                
                Button(action: {
                    Unity.shared.show()
                    
                    if dataIsFetched == true
                    {
                        Unity.shared.sendMessage("Visuals", methodName: "SetValues", message: "dataisfetched")
                    }
                })
                {
                        Text("launch Unity")
                        .frame(width: 200, height: 60)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(10)
            
            
                }
                
            }.padding(70)
                
                
              
                
            }
           
           
        }
       
    }
        
}


        
    struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View
    {
        SwiftUIView()
    }
}
