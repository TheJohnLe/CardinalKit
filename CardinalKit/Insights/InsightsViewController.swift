//
//  InsightsViewController.swift
//  CardinalKit
//
//  Created by John Le on 11/19/20.
//

import SwiftUI
import CareKit
import CareKitUI
import CareKitStore

class InsightsViewController: OCKDailyPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController,
                                          prepare listViewController: OCKListViewController, for date: Date)  {
        
        //Add Back Pain Chart
        let backPainInsightsLineChartVC = self.backPainChartViewController(date: date)
        listViewController.appendViewController(backPainInsightsLineChartVC, animated: true)
        
        //Add Steps Count Chart
        let stepsCountInsightsBarChartVC = self.dailyStepsChartViewController(date: date)
        listViewController.appendViewController(stepsCountInsightsBarChartVC, animated: true)
        
        //Add Daily Progress Chart
        let dailyProgressInsightsLineChartVC = self.dailyProgressChartViewController(date: date)
        listViewController.appendViewController(dailyProgressInsightsLineChartVC, animated: true)
        
        //Add Daily Distance Chart
//        let dailyDistanceInsightsBarChartVC = self.dailyDistanceChartViewController(date: date)
//        listViewController.appendViewController(dailyDistanceInsightsBarChartVC, animated: true)
    }
    
    //MARK: Helper methods
    func backPainChartViewController(date: Date) -> OCKCartesianChartViewController {
        let averagePainAggregator = OCKEventAggregator.custom { dailyEvents -> Double in
            var result: Double = 0
            for event in dailyEvents {
                guard let outcome = event.outcome else { continue }
                let values = outcome.values
                if values.count == 2 {
                    var outcomeValue = values[0].stringValue ?? ""
                    if outcomeValue.contains("average:") {
                        let actualValue = Double(outcomeValue.components(separatedBy: ":").last!)!
                        result += actualValue
                    }
                    
                    outcomeValue = values[1].stringValue ?? ""
                    if outcomeValue.contains("average:") {
                        let actualValue = Double(outcomeValue.components(separatedBy: ":").last!)!
                        result += actualValue
                    }
                }
            }
            return result
        }
        
        let maxPainPainAggregator = OCKEventAggregator.custom { dailyEvents -> Double in
            var result: Double = 0
            for event in dailyEvents {
                guard let outcome = event.outcome else { continue }
                let values = outcome.values
                if values.count == 2 {
                    var outcomeValue = values[0].stringValue ?? ""
                    if outcomeValue.contains("max:") {
                        let actualValue = Double(outcomeValue.components(separatedBy: ":").last!)!
                        result += actualValue
                    }
                    
                    outcomeValue = values[1].stringValue ?? ""
                    if outcomeValue.contains("max:") {
                        let actualValue = Double(outcomeValue.components(separatedBy: ":").last!)!
                        result += actualValue
                    }
                }
            }
            return result
        }
        
        let averagePainDataSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.backPainEpisodes.rawValue,
            legendTitle: "Average Pain",
            gradientStartColor: Colors.lightBlue.color,
            gradientEndColor: Colors.lightBlue.color,
            markerSize: 8,
            eventAggregator: averagePainAggregator)
        
        let maxPainDataSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.backPainEpisodes.rawValue,
            legendTitle: "Maximum Pain",
            gradientStartColor: Colors.blue.color,
            gradientEndColor: Colors.blue.color,
            markerSize: 8,
            eventAggregator: maxPainPainAggregator)
        
        let configurations = [averagePainDataSeries, maxPainDataSeries]
        let barChartVC = OCKCartesianChartViewController(plotType: .bar, selectedDate: date,
                                                         configurations: configurations,
                                                         storeManager: self.storeManager)
        barChartVC.chartView.headerView.titleLabel.text = "Back Pain"
        barChartVC.chartView.headerView.detailLabel.text = "Pain Level"
        barChartVC.chartView.headerView.accessibilityLabel = "Pain, This Week"
        return barChartVC
    }
    
    func dailyStepsChartViewController(date: Date) -> OCKCartesianChartViewController {
        let stepsAggregator = OCKEventAggregator.custom { dailyEvents -> Double in
            var result: Double = 0.0
            for event in dailyEvents {
                guard let outcome = event.outcome else { continue }
                result += Double(outcome.values.first!.integerValue ?? 0)
            }
            return result
        }
        
        let stepsLineDataSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue,
            legendTitle: "Number of Steps",
            gradientStartColor: Colors.blue.color,
            gradientEndColor: Colors.blue.color,
            markerSize: 4,
            eventAggregator: stepsAggregator)
        
        let lineChartVC = OCKCartesianChartViewController(plotType: .bar, selectedDate: date,
                                                          configurations: [stepsLineDataSeries],
                                                          storeManager: self.storeManager)
        lineChartVC.chartView.headerView.titleLabel.text = "Daily Steps"
        lineChartVC.chartView.headerView.detailLabel.text = "Number of Steps"
        lineChartVC.chartView.headerView.accessibilityLabel = "Steps, This Week"
        return lineChartVC
    }
    
    func dailyProgressChartViewController(date: Date) -> OCKCartesianChartViewController {
        let stepsAggregator = OCKEventAggregator.custom { dailyEvents -> Double in
            var total: Double = 0
            var completed: Double = 0
            for event in dailyEvents {
                guard let outcome = event.outcome else { continue }
                if let intValue = outcome.values.first!.integerValue {
                    completed += Double(intValue)
                }
                
                if let strValue = outcome.values.first!.stringValue {
                    total += Double(strValue.components(separatedBy: ":").last!)!
                }
                
                if let intValue = outcome.values.last!.integerValue {
                    completed += Double(intValue)
                }
                
                if let strValue = outcome.values.last!.stringValue {
                    total += Double(strValue.components(separatedBy: ":").last!)!
                }
            }
            
            if completed > 0 {
                return ((completed/total) * 100)
            }
            
            return 0
        }
        
        let stretchingDataSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.stretchingEpisodes.rawValue,
            legendTitle: "",
            gradientStartColor: Colors.blue.color,
            gradientEndColor: Colors.blue.color,
            markerSize: 4,
            eventAggregator: stepsAggregator)
        
        let lineChartVC = OCKCartesianChartViewController(plotType: .line, selectedDate: date,
                                                          configurations: [stretchingDataSeries],
                                                          storeManager: self.storeManager)
        lineChartVC.chartView.headerView.titleLabel.text = "Stretching"
        lineChartVC.chartView.headerView.detailLabel.text = "Completion"
        lineChartVC.chartView.headerView.accessibilityLabel = "Progress, This Week"
        return lineChartVC
    }
    
//    func dailyDistanceChartViewController(date: Date) -> OCKCartesianChartViewController {
//        let distanceAggregator = OCKEventAggregator.custom { dailyEvents -> Double in
//            var result: Double = 0.0
//            for event in dailyEvents {
//                guard let outcome = event.outcome else { continue }
//                let values = outcome.values
//                if values.count == 2 {
//                    var outcomeValue = values[0].stringValue ?? ""
//                    if outcomeValue.contains("distance:") {
//                        let actualValue = Double(outcomeValue.components(separatedBy: ":").last!)!
//                        result += actualValue
//                    }
//
//                    outcomeValue = values[1].stringValue ?? ""
//                    if outcomeValue.contains("distance:") {
//                        let actualValue = Double(outcomeValue.components(separatedBy: ":").last!)!
//                        result += actualValue
//                    }
//                }
//            }
//            return result
//        }
//
//        let distanceLineDataSeries1 = OCKDataSeriesConfiguration(
//            taskID: CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue,
//            legendTitle: "",
//            gradientStartColor: Colors.blue.color,
//            gradientEndColor: Colors.blue.color,
//            markerSize: 4,
//            eventAggregator: distanceAggregator)
//
//        let distanceLineDataSeries2 = OCKDataSeriesConfiguration(
//            taskID: CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue,
//            legendTitle: "",
//            gradientStartColor: Colors.blue.color,
//            gradientEndColor: Colors.blue.color,
//            markerSize: 4,
//            eventAggregator: distanceAggregator)
//
//        let lineChartVC = OCKCartesianChartViewController(plotType: .bar, selectedDate: date,
//                                                          configurations: [distanceLineDataSeries1, distanceLineDataSeries2],
//                                                          storeManager: self.storeManager)
//        lineChartVC.chartView.headerView.titleLabel.text = "Six Minutes Walk"
//        lineChartVC.chartView.headerView.detailLabel.text = "Distance (in meter)"
//        lineChartVC.chartView.headerView.accessibilityLabel = "Steps, This Week"
//        return lineChartVC
//    }
}
