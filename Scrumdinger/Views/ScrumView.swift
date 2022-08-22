//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Lucy on 22/08/22.
//

import SwiftUI

struct ScrumView: View{
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    
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
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView){
                NavigationView{
                    DetailEditView(data: $newScrumData)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction){
                                Button("Dismiss"){
                                    isPresentingNewScrumView = false
                                }
                            }
                            
                            ToolbarItem(placement: .confirmationAction){
                                Button("Add"){
                                    let newScrum = DailyScrum(data: newScrumData)
                                    
                                    scrums.append(newScrum)
                                    isPresentingNewScrumView = false
                                }
                            }
                        }
                }
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
