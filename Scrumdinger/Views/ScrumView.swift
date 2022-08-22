//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Lucy on 22/08/22.
//

import SwiftUI

struct ScrumView: View{
    @Binding var scrums: [DailyScrum]
    
    var body: some View{
        List{
            ForEach($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar{
                Button(action: {}){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        
    }
}

struct ScrumView_Preview: PreviewProvider{
    static var previews: some View{
        NavigationView{
            ScrumView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
