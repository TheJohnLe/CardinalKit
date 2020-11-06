//
//  PainSurveyViewController.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import CareKit
import CareKitUI
import CareKitStore

class PainSurveyViewSynchronizer: OCKInstructionsTaskViewSynchronizer {

    // Customize the initial state of the view
    override func makeView() -> OCKInstructionsTaskView {
        let instructionsView = super.makeView()
        instructionsView.completionButton.label.text = "Start Survey"
        return instructionsView
    }
    
    // Customize how the view updates
    override func updateView(_ view: OCKInstructionsTaskView, context: OCKSynchronizationContext<OCKTaskEvents>) {
        super.updateView(view, context: context)

        // Check if an answer exists or not and set the detail label accordingly
//        if let answer = context.viewModel.firstEvent?.outcome?.values.first?.integerValue {
//            view.headerView.detailLabel.text = "Pain Rating: \(answer)"
//        } else {
//            view.headerView.detailLabel.text = "Rate your pain on a scale of 1 to 10"
//        }
    }
}
