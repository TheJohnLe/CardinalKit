//
//  BreathingSurveyViewController.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import ResearchKit
import CareKit
import CareKitUI

// 1. Subclass a task view controller to customize the control flow and present a ResearchKit survey!
class BreathingSurveyViewController: OCKInstructionsTaskViewController, ORKTaskViewControllerDelegate {

    // 2. This method is called when the use taps the button!
    override func taskView(_ taskView: UIView & OCKTaskDisplayable, didCompleteEvent isComplete: Bool, at indexPath: IndexPath, sender: Any?) {

        // 2a. If the task was marked incomplete, fall back on the super class's default behavior or deleting the outcome.
        if !isComplete {
            super.taskView(taskView, didCompleteEvent: isComplete, at: indexPath, sender: sender)
            return
        }
        
        // 2b. If the user attempted to mark the task complete, display a ResearchKit survey.
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        let breathingTask = ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: intendedUseDescription, duration: 10, handOptions: .both, options: ORKPredefinedTaskOption())
        let surveyViewController = ORKTaskViewController(task: breathingTask, taskRun: nil)
        surveyViewController.delegate = self

        // 3a. Present the survey to the user
        present(surveyViewController, animated: true, completion: nil)
    }

    // 3b. This method will be called when the user completes the survey.
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
        guard reason == .completed else {
            taskView.completionButton.isSelected = false
            return
        }

        // 4a. Retrieve the result from the ResearchKit tapping
        // TODO: Make sure to get results from the specified identifiers "tapping.left", and "tapping.right"
        
        let leftSurvey = taskViewController.result.results!.first(where: {$0.identifier == "tapping.left"})!
        print("Left Survey Results", leftSurvey)
        let rightSurvey = taskViewController.result.results!.first(where: {$0.identifier == "tapping.right"})!
        print("Right Survey Results", rightSurvey)
        let testLength = rightSurvey.value(forKey: "samples")
        print("What is this", testLength)

        // 4b. Save the result into CareKit's store

    }
}
