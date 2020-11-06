//
//  CareKitController.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI
import CareKit
import CareKitStore

struct CareKitController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        // Manage syncronization of a CoreData store
        let synchronizedStoreManager: OCKSynchronizedStoreManager = {
            let store = OCKStore(name: "SFSU Sample Tracker")
            let healthKitPassthroughStore = OCKHealthKitPassthroughStore(name: "hk-passthrough-store", type: .onDisk)
            store.populateDailyTasks()
            let coordinator = OCKStoreCoordinator()
            coordinator.attach(store: store)
            coordinator.attach(eventStore: healthKitPassthroughStore)
            let manager = OCKSynchronizedStoreManager(wrapping: coordinator)
            return manager
        }()
        // Call the entire Task View Controller and connect to the created store manager
        let picker = ActivityTaskViewController(storeManager: synchronizedStoreManager)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
