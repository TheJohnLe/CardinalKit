//
//  InsightsReferenceManager.swift
//  CardinalKit
//
//  Created by John Le on 11/18/20.
//

import Foundation

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
    
    static let sharedInsights = InsightsReferenceManager()
}
