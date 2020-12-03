//
//  InsightsView.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI

struct InsightsView: View {

    // var data: [CGFloat] = [4,3,2,0,6,1,2]

    let manager = CareStoreReferenceManager.synchronizedStoreManager
    var data = CareStoreReferenceManager.testData


    var body: some View {
        // Option 1: Laying Visual Charts and placing resulting data in parameter
        //ChartView(title: "Cough", data: data)
        
        // Option 2: Using data from the OCKStore
        InsightsController()
    }
}
