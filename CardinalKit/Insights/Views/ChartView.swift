//
//  ChartView.swift
//  CardinalKit
//
//  Created by John Le on 11/18/20.
//

import CareKitUI
import SwiftUI

struct ChartView: UIViewRepresentable {
    var title: String
    var detail: String?
    var data = [CGFloat]()
    
    func makeUIView(context: Context) -> OCKCartesianChartView {
        let chartView = OCKCartesianChartView(type: .bar)
        
        chartView.headerView.titleLabel.text = "Coughing"
        
        chartView.graphView.dataSeries = [
            OCKDataSeries(values: data, title: "Coughing")
        ]
        
        return chartView
    }
    
    func updateUIView(_ uiView: OCKCartesianChartView, context: Context) {
        uiView.headerView.titleLabel.text = loc(title)
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChartView(title: "Test", data: [0,0,0,0,0,0,0])
        }
    }
}
