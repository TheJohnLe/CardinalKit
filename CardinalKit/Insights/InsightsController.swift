//
//  InsightsController.swift
//  CardinalKit
//
//  Created by John Le on 11/20/20.
//

import SwiftUI
import CareKit
import CareKitStore

struct InsightsController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        // Call the entire Task View Controller and connect to the created store manager
        let picker = InsightsViewController(storeManager: CareStoreReferenceManager.synchronizedStoreManager)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
