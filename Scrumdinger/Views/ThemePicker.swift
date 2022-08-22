//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Lucy on 22/08/22.
//

import SwiftUI

struct ThemePicker: View{
    @Binding var selection: Theme
    
    var body: some View{
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}

struct ThemePicker_Preview: PreviewProvider{
    static var previews: some View{
        ThemePicker(selection: .constant(.periwinkle))
    }
}

