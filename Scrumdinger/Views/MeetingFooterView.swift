//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Lucy on 22/08/22.
//

import SwiftUI

struct MeetingFooterView: View{
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {$0.isCompleted}) else { return nil }
        
        return index + 1
    }
    
    private var isLastSpeaker: Bool{
        return speakers.dropLast().allSatisfy{ $0.isCompleted }
    }
    
    private var speakertext: String{
        guard let speakerNumber = speakerNumber else {return "No more speakers"}
        
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View{
        VStack{
            HStack{
                if isLastSpeaker{
                    Text("Last Speaker")
                }else{
                    
                    Text("Speker 1 of 3")
                    Spacer()
                    Button(action: skipAction){
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                    
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Preview: PreviewProvider{
    static var previews: some View{
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers,skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}

