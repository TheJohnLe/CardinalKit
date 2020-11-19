//
//  InsightsView.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI

struct InsightsView: View {

    var data: [CGFloat] = [4,3,2,0,6,1,2]
    
    var body: some View {
        ChartView(title: "Cough", data: data)
    }
}
