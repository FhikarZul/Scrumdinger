//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Lucy on 20/08/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumView(scrums: $scrums)
            }
        }
    }
}
