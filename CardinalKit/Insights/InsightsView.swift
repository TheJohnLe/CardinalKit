//
//  InsightsView.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI

//struct InsightsView: UIViewControllerRepresentable {
//    typealias UIViewControllerType = UIViewControllerType
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        // Call the entire Task View Controller and connect to the created store manager
//        let viewController = ActivityTaskViewController(storeManager: synchronizedStoreManager)
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//    }
//}
struct InsightsView: View {
    
    var data: [CGFloat] = [4,3,2,0,6,1,2]

    
    var body: some View {
        ChartView(title: "Cough", data: data)
    }
}
