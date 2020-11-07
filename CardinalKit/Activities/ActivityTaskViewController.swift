//
//  ActivityTaskViewController.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI
import CareKit
import CareKitStore

final class ActivityTaskViewController: OCKDailyPageViewController {
    
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController, prepare listViewController: OCKListViewController, for date: Date) {
        let identifiers = CareStoreReferenceManager.TaskIdentifiers.allCases.map { $0.rawValue }
        var query = OCKTaskQuery(for: date)
        query.ids = identifiers
        query.excludesTasksWithNoEvents = true
        
        storeManager.store.fetchAnyTasks(query: query, callbackQueue: .main) { result in
            guard let tasks = try? result.get() else { return }
            
            tasks.forEach { task in
                switch task.id {
                // 1. Create new card of the View Controller containing the specified task
                // 2. Append card to the listViewController
                case CareStoreReferenceManager.TaskIdentifiers.breathingEpisodes.rawValue:
                    let breathingCard = BreathingSurveyViewController(viewSynchronizer: BreathingSurveyViewSynchronizer(), task: task, eventQuery: OCKEventQuery(for: Date()), storeManager: self.storeManager)
                    listViewController.appendViewController(breathingCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue:
                    let coughingCard = OCKButtonLogTaskViewController(task: task,
                                eventQuery: .init(for: date),storeManager: self.storeManager)
                    listViewController.appendViewController(coughingCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.stretchingEpisodes.rawValue:
                    let stretchingCard = OCKSimpleTaskViewController(task: task, eventQuery: .init(for: date), storeManager: self.storeManager);
                    listViewController.appendViewController(stretchingCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue:
                    let walkingCard = WalkingSurveyViewController(viewSynchronizer: WalkingSurveyViewSynchronizer(), task: task, eventQuery: OCKEventQuery(for: Date()), storeManager: self.storeManager)
                    listViewController.appendViewController(walkingCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.testEpisodes.rawValue:
                    let testCard = OCKInstructionsTaskViewController(task: task, eventQuery: .init(for: date), storeManager: self.storeManager)
                    listViewController.appendViewController(testCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.backPainEpisodes.rawValue:
                    let backPainCard = PainSurveyViewController(viewSynchronizer: PainSurveyViewSynchronizer(), task: task, eventQuery: OCKEventQuery(for: Date()), storeManager: self.storeManager)
                    listViewController.appendViewController(backPainCard, animated: true)
                default: return
                }
            }
        }
    }
}
