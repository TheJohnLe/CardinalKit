//
//  CareStoreReferenceManager.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import Foundation
import CareKit
import CareKitStore

// Singleton wrapper to hold a reference to OCKSyncronizedStoreManager and task identifiers
final class CareStoreReferenceManager {
    
    enum TaskIdentifiers: String, CaseIterable {
        case backPainEpisodes
        case breathingEpisodes
        case coughingEpisodes
        case doxylamineEpisodes
        case stretchingEpisodes
        case testEpisodes
        case walkingEpisodes
    }
    
    static let shared = CareStoreReferenceManager()
    
    // Manage syncronization of a CoreData store
    lazy var synchronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "SFSU Sample Tracker")
        store.populateDailyTasks()
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()
    
    private init() {}
    
}
