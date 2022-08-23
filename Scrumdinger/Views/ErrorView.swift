//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Lucy on 23/08/22.
//

import SwiftUI

struct ErrorView: View{
    var errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        NavigationView{
            VStack{
                Text("An error has accurred!")
                    .font(.title)
                    .padding(.bottom)
                
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                
                Spacer()
            }
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Preview: PreviewProvider{
    enum SampleError: Error{
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper{
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error")
    }
    
    static var previews: some View{
        ErrorView(errorWrapper: wrapper)
    }
}
