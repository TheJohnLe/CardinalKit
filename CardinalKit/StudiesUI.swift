//
//  StudiesUI.swift
//  CardinalKit
//
//  Created by John Le on 11/6/20.
//

import SwiftUI

struct StudiesUI: View {
    
    let color: Color
    let config = CKPropertyReader(file: "CKConfiguration")
    var date = ""

    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM. d, YYYY"
        self.date = formatter.string(from: date)
    }
        
    var body: some View {
        TabView {
            ActivitiesView()
                .tabItem {
                    Image("tab_activities").renderingMode(.template)
                    Text("Activities")
                }
            InsightsView()
                .tabItem {
                    Image("tab_dashboard").renderingMode(.template)
                    Text("Insights")
                }
            LearnView()
                .tabItem {
                    Image("tab_learn").renderingMode(.template)
                    Text("Learn")
                }
            ProfileView()
                .tabItem {
                    Image("tab_profile").renderingMode(.template)
                    Text("Profile")
                }
        }.accentColor(self.color)
    }
}

struct StudiesUI_Previews: PreviewProvider {
    static var previews: some View {
        StudiesUI()
    }
}
