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
        
        // Create breathing task
        var breathingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.breathingEpisodes.rawValue, title: "Breathe", carePlanUUID: nil, schedule: schedule)
        breathingTask.instructions = "Repeat 10 times"
        
        // Create coughing task
        var coughingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue,
                                   title: "Track coughing",
                                   carePlanUUID: nil, schedule: schedule)
        coughingTask.instructions = "If you have coughed for a duration of 1 minute or more, please log it here."
        
        // Create stretching task
        var stretchingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.stretchingEpisodes.rawValue,
                                     title:"Track stretching",
                                     carePlanUUID: nil, schedule: schedule)
        stretchingTask.instructions = "From a standing position, reach down as far as you can to try to touch the floor without bending your legs."
        
        // Create back pain survey task /* Note: Requires ORK ViewController */
        var backPainTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.backPainEpisodes.rawValue,
                                   title: "Pain",
                                   carePlanUUID: nil, schedule: schedule)
        backPainTask.instructions = "Lower Back"
        
        // Create walking task
        var walkingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue, title: "Walk Test", carePlanUUID: nil, schedule: schedule)
        walkingTask.instructions = "Perform a 6-minute walk"
        
        
        // TESTING: Test Task using custom View task
        var testTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.testEpisodes.rawValue, title: "This is a Test Task using custom Views", carePlanUUID: nil, schedule: schedule)
        testTask.instructions = "Test Instructions Would Appear Here"
        
        // Add the static tasks here
        addTask(breathingTask)
        addTask(coughingTask)
        addTask(stretchingTask)
        addTask(backPainTask)
        addTask(walkingTask)
        addTask(testTask)
    }
}
