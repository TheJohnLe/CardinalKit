//
//  OCKStore.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import Foundation
import CareKitStore

extension OCKStore {
    
    // Adds tasks and contacts to the store
    func populateDailyTasks() {
        
        // Create Schedule
        let schedule = OCKSchedule.dailyAtTime(hour: 8, minutes: 0, start: Date(), end: nil, text: nil, duration: .allDay, targetValues: [OCKOutcomeValue(30.0, units: "Minutes")
        ])
        
        // Create coughing task
        var coughingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue,
                                   title: "Track coughing",
                                   carePlanUUID: nil, schedule: schedule)
        coughingTask.instructions = "If you have coughed for a duration of 1 minute or more, please log it here."
        coughingTask.impactsAdherence = true
        
        // Create stretching task
        var stretchingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.stretchingEpisodes.rawValue,
                                     title:"Track stretching",
                                     carePlanUUID: nil, schedule: schedule)
        stretchingTask.instructions = "From a standing position, reach down as far as you can to try to touch the floor without bending your legs."
        stretchingTask.impactsAdherence = true
        
        // Create back pain survey task /* Note: Requires ORK ViewController */
        var backPainTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.backPainEpisodes.rawValue,
                                   title: "Pain",
                                   carePlanUUID: nil, schedule: schedule)
        backPainTask.instructions = "Lower Back"
        backPainTask.impactsAdherence = true;
        
        // Create walking task
        var walkingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue, title: "Walk for 6 minutes", carePlanUUID: nil, schedule: schedule)
        walkingTask.instructions = "Walk for at least 6 minutes."
        walkingTask.impactsAdherence = true
        
        
        // TESTING: Test Task using custom View task
        var testTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.testEpisodes.rawValue, title: "This is a Test Task using custom Views", carePlanUUID: nil, schedule: schedule)
        testTask.instructions = "Test Instructions Would Appear Here"
        testTask.impactsAdherence = false
        
        // Add the static tasks here
        addTask(coughingTask)
        addTask(stretchingTask)
        addTask(backPainTask)
        addTask(walkingTask)
        addTask(testTask)
        
    }
}
