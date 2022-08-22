//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Lucy on 22/08/22.
//

import SwiftUI

struct MeetingHeaderView: View{
    let secondElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSecond: Int{
        secondElapsed + secondRemaining
    }
    
    private var progress: Double{
        guard totalSecond > 0 else { return 1 }
        
        return Double(secondElapsed) / Double(totalSecond)
    }
    
    private var minutesRemaining: Int{
        secondRemaining / 60
    }
    
    var body: some View{
        ProgressView(value: progress)
            .progressViewStyle(ScrumProgressViewStyle(theme: theme))
        
        HStack{
            VStack(alignment: .leading){
                Text("Second Elapsed")
                    .font(.caption)
                
                Label("\(secondElapsed)", systemImage: "hourglass.bottomhalf.fill")
            }
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("Second Remaining")
                    .font(.caption)
                
                Label("\(secondRemaining)", systemImage: "hourglass.tophalf.fill")
                    .labelStyle(.trailingIcon)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
        
    }
}

struct MeetingHeaderView_Preview: PreviewProvider{
    static var previews: some View{
        MeetingHeaderView(secondElapsed: 60, secondRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
