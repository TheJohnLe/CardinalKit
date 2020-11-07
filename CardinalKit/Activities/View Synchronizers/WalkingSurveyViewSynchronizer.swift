//
//  WalkingSurveyViewSynchronizer.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import CareKit
import CareKitUI
import CareKitStore

class WalkingSurveyViewSynchronizer: OCKInstructionsTaskViewSynchronizer {

    // Customize the initial state of the view
    override func makeView() -> OCKInstructionsTaskView {
        let instructionsView = super.makeView()
        instructionsView.completionButton.label.text = "Start Walking"
        return instructionsView
    }
    
    // Customize how the view updates
    override func updateView(_ view: OCKInstructionsTaskView, context: OCKSynchronizationContext<OCKTaskEvents>) {
        super.updateView(view, context: context)
        
    }
}
