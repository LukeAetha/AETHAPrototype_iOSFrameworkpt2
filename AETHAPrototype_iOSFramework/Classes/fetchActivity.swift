//
//  fetchActivity.swift
//  UnityBrdige
//
//  Created by Lukas Dworschak on 20.03.22.
//

import Foundation
import HealthKit


class fetchActivity: ObservableObject
{
    @Published var healthStore = HKHealthStore()
    
    
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
        guard let sampleType = HKCategoryType.quantityType(forIdentifier: .stepCount) else
        {
            return

        }
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        var interval = DateComponents()
        interval.day = 1
        let query = HKStatisticsCollectionQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        query.initialResultsHandler =
        {
            query,result,error in

            if let myresult = result
            {
                myresult.enumerateStatistics(from: startDate, to: Date()) { (statistic, value) in
                    if let count = statistic.sumQuantity()
                    {
                        let val = count.doubleValue(for: HKUnit.count())
                        print("total steps taken today is \(val) steps")
                    }

                }
            }

        }
    }
}
