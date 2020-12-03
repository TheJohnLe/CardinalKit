//
//  CareStoreReferenceManager.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI
import CareKit
import CareKitStore

// Singleton wrapper to hold a reference to OCKSyncronizedStoreManager and task identifiers
final class CareStoreReferenceManager {
    
    enum TaskIdentifiers: String, CaseIterable {
        case backPainEpisodes
        //case breathingEpisodes
        case coughingEpisodes
        case doxylamineEpisodes
        case stretchingEpisodes
        case testEpisodes
        //case walkingEpisodes
    }
    
    static let shared = CareStoreReferenceManager()
    
    // Test hardcoded Insight Data
    static var testData: [CGFloat] = [4,3,2,0,6,1,2]
    
    // Manages synchronization of a CoreData store
    static var synchronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "COVID19Tracker")
        store.populateDailyTasks()
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()
    
    private init() {}
    
}
