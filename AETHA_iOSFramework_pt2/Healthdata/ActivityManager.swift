//
//  ActivityManager.swift
//  AETHA_iOSFramework_pt2
//
//  Created by Lukas Dworschak on 14.04.22.
//

import Foundation
import HealthKit

class ActivityManager: ObservableObject
{
    @Published var healthStore = HKHealthStore()
    @Published var stepCount: String = ""
    
    
    init()
    {
        authorizeHealthKit()
    }
    
    func authorizeHealthKit()
    {
        let share = Set([HKCategoryType.quantityType(forIdentifier: .stepCount)!])
        let read = Set([HKCategoryType.quantityType(forIdentifier: .stepCount)!])
        healthStore.requestAuthorization(toShare: share, read: read) {(chk, error) in
            if(chk){
                print("Permission granted")
                self.fetchStepCount()
            }
            
        }
    }

    func fetchStepCount()
    {
        guard let sampleType = HKCategoryType.quantityType(forIdentifier: .stepCount)
        else{return}
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        var interval = DateComponents()
        interval.day = 1
        let query = HKStatisticsCollectionQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        
        query.initialResultsHandler = {query,result,error in
        
            if let myresult = result
                  {
                      myresult.enumerateStatistics(from: startDate, to: Date()) { (statistic, value) in
                          if let count = statistic.sumQuantity()
                          {
                              let val = count.doubleValue(for: HKUnit.count())
                              self.stepCount = "\(val)"
                              print("total steps taken today is \(val) steps")
      
                          }
                    }
            }
            
        }
        healthStore.execute(query)
    }
}
