//
//  SwiftUIView.swift
//  UnityBrdige
//
//  Created by Lukas Dworschak on 19.03.22.
//

import SwiftUI
import CoreLocationUI



struct SwiftUIView: View {

    
                                                    //buttons toggle to activate when all are pressed
    @State var button1: Bool = false
    @State var button2: Bool = false
    @State var button3: Bool = false
    
    
    @State var dataIsFetched = false
    
    //@StateObject var locationManager = fetchLocation()
    //@StateObject var healthStore = fetchActivity()
    @StateObject var locationManager = LocationManager()
    
    
    
    
    
    var body: some View {
            ZStack (alignment: .top)
            {
                LinearGradient(gradient: Gradient(colors: [Color("aethagrey"), Color("aethaorange"), Color("aethapink")]),startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(width: 1000, height: 150 )
                
                HStack (alignment: .top)
                {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 120, height: 150)
                        .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 50)
                        {
                            button1 = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                                {
                                    fetchData()
                                }
                        }
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 120, height: 150)
                        .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 50)
                        {
                            button2 = true
                        
                        }
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 120, height: 150)
                        .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 50)
                        {
                            button3 = true

                        }
                        
                }
                .fullScreenCover(isPresented: $dataIsFetched, content:
                {
                    DataView()
                })
            }
            .onAppear(perform:
            {
                //locationManager.setupLocation()
                locationManager.requestLocation()
            })
           
           
        }
    
    func fetchData()
    {
            if button1 == true && button2 == true && button3 == true
            {
                //locationManager.requestLocation()
                //healthStore.authorizeHealthKit()
                HapticManager.instance.notification(type: .warning)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3)
                    {
                        dataIsFetched = true
                    }
                
            }
            else
            {
                    return
            }
    }
    
    
       
}
    

private class HapticManager
{
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
    {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}



        
    struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View
    {
        SwiftUIView()
    }
}
