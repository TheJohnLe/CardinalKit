//
//  InsightsReferenceManager.swift
//  CardinalKit
//
//  Created by John Le on 11/18/20.
//

import SwiftUI

final class InsightsReferenceManager {
    enum TaskIdentifiers: String, CaseIterable {
        case backPainEpisodes
        case breathingEpisodes
        case coughingEpisodes
        case doxylamineEpisodes
        case stretchingEpisodes
        case testEpisodes
        case walkingEpisodes
    }
    
    static let sharedInsightsManager = InsightsReferenceManager()
    
    var testData: [CGFloat] = [4,3,2,0,6,1,2]
}
